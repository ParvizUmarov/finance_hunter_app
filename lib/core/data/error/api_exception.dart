
abstract class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class NoInternetException extends ApiException {
  NoInternetException() : super("Нет соединения с интернетом");
}

class TimeoutException extends ApiException {
  TimeoutException() : super("Время ожидания истекло");
}

class ConnectionException extends ApiException {
  ConnectionException() : super("Время подключения истекло");
}

class SendTimeoutException extends ApiException {
  SendTimeoutException() : super("Время отправки истекло");
}

class ServerException extends ApiException {
  final int? statusCode;
  final dynamic responseData;

  ServerException({
    required String message,
    this.statusCode,
    this.responseData,
  }) : super("Ошибка сервера [$statusCode]: $message");
}

class CancelledRequestException extends ApiException {
  CancelledRequestException() : super("Запрос отменён");
}

class UnknownApiException extends ApiException {
  UnknownApiException([String? message])
      : super("Неизвестная ошибка: ${message ?? 'без сообщения'}");
}

class ParseDataException extends ApiException {
  ParseDataException() : super("Ошибка парсинга данных");
}
