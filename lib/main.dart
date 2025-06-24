import 'core/core.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppDependencies appDependencies = AppDependencies();
  final IDataBase iDataBase = SharedPrefs();
  await iDataBase.init();

  runApp(AppScreen(dependencies: appDependencies, iDataBase: iDataBase));
}
