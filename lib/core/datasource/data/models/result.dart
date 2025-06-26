import 'package:finance_hunter_app/core/core.dart';

class Result<T> {
  final ValueChanged<T> onSuccess;
  final ValueChanged<Exception> onError;

  Result({required this.onSuccess, required this.onError});
}
