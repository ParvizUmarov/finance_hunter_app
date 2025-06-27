import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/internet_cubit/internet_cubit.dart';

class OfflineAwareScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  const OfflineAwareScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<InternetStatusCubit, InternetStatus>(
            builder: (context, status) {
              if (status == InternetStatus.offline) {
                return Container(
                  width: double.infinity,
                  color: Colors.red.shade400,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Оффлайн режим',
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
