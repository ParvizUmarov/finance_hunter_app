import 'package:finance_hunter_app/features/app/presentation/cubit/internet_cubit/internet_cubit.dart';

import 'core/core.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDependencies appDependencies = AppDependencies();
  final IDataBase iDataBase = SharedPrefsImpl();
  await iDataBase.init();

  runApp(AppScreen(dependencies: appDependencies, iDataBase: iDataBase));
}
