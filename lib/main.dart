import 'core/core.dart';
import 'features/features.dart';

void main() {
  final AppDependencies appDependencies = AppDependencies();
  runApp(AppScreen(dependencies: appDependencies));
}
