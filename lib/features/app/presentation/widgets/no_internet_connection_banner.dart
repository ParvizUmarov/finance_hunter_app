import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/app/presentation/cubit/internet_cubit/internet_cubit.dart';

class NoInternetConnectionBanner extends StatelessWidget {
  const NoInternetConnectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetStatusCubit, InternetStatus>(
      builder: (context, status) {
        if (status == InternetStatus.offline) {
          return Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const SafeArea(
              bottom: false,
              child: Center(
                child: Text(
                  'Нет подключения к интернету',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
