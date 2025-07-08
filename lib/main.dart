import 'core/core.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  final IDataBase iDataBase = SharedPrefsImpl();
  await iDataBase.init();
  final AppDependencies appDependencies = AppDependencies(iDataBase);

  runApp(AppScreen(dependencies: appDependencies, iDataBase: iDataBase));
}
