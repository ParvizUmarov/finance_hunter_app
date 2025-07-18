import 'dart:ui';

import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';
import 'package:finance_hunter_app/features/cash_flow/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/cubit/operation_detail_cubit.dart';

class AppScreen extends StatefulWidget {
  final AppDependencies dependencies;
  final IDataBase iDataBase;

  const AppScreen({
    super.key,
    required this.dependencies,
    required this.iDataBase,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> with WidgetsBindingObserver {
  bool _blur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      setState(() {
        _blur = true;
      });
    } else if (state == AppLifecycleState.resumed) {

      setState(() {
        _blur = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<IDataBase>.value(value: widget.iDataBase),
        RepositoryProvider<TransactionRepository>.value(
          value: widget.dependencies.transactionRepository,
        ),
        RepositoryProvider<CategoryRepository>.value(
          value: widget.dependencies.categoryRepository,
        ),
        RepositoryProvider<BankAccountRepository>.value(
          value: widget.dependencies.bankAccountRepository,
        ),
        BlocProvider(
          create: (context) => CurrencyCubit(
            bankAccountRepository: widget.dependencies.bankAccountRepository,
          )..init(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(
            iDataBase: widget.iDataBase,
            storageService: widget.dependencies.secureStorageService,
          )..init(),
        ),
        BlocProvider(
          create: (context) => AppLockCubit(
            storageService: widget.dependencies.secureStorageService,
            localAuth: widget.dependencies.localAuthentication,
          )..isLockScreenEnabled(),
        ),
        BlocProvider(
          create: (context) => InternetStatusCubit(
            widget.dependencies.connectivity,
            widget.dependencies.transactionRepository,
          ),
        ),
        BlocProvider(
          create: (context) => OperationDetailCubit(
            transactionRepository: widget.dependencies.transactionRepository,
            categoryRepository: widget.dependencies.categoryRepository,
            bankAccountRepository: widget.dependencies.bankAccountRepository,
          ),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return  MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Finance Hunter app',
            localizationsDelegates: S.delegates,
            supportedLocales: S.locales,
            locale: state.locale,
            theme: LightAppTheme.getThemeData(
              primaryColor: state.primaryColor,
            ),
            darkTheme: DarkAppTheme.getThemeData(
              primaryColor: state.primaryColor,
            ),
            themeMode: state.themeMode,
            routerConfig: routeConfig,
            builder: (context, child) {
              return Stack(
                children: [
                  if (child != null) child,
                  if (_blur)
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(color: Colors.black.withOpacity(0.2)),
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
