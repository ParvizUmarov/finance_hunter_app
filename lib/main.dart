import 'core/core.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await workerManager.init();
  await dotenv.load();
  final IDataBase iDataBase = SharedPrefsImpl();
  await iDataBase.init();
  final AppDependencies appDependencies = AppDependencies(iDataBase: iDataBase);

  runApp(AppScreen(dependencies: appDependencies, iDataBase: iDataBase));
}
