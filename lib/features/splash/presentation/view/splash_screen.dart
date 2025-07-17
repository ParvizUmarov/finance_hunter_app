import 'package:finance_hunter_app/features/app_lock/presentation/cubit/app_lock_cubit.dart';
import 'package:finance_hunter_app/features/splash/presentation/utils/index.dart';

class SplashScreen extends StatefulWidget {
  static const String screenName = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AppLockCubit>().entrance();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<AppLockCubit, AppLockState>(
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_){
          if(state.enabledPinCode){
            AppLockRoute().go(context);
          }else{
            ExpensesRoute().go(context);
          }
        });

      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
