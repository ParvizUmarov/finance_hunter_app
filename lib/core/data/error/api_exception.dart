
abstract class ApiException implements Exception {
  final int statusCode;
  final String message;
  ApiException(this.message, this.statusCode);

  @override
  String toString() => message;
}

class NoInternetException extends ApiException {
  NoInternetException([String? message])
      : super(message ?? "Нет соединения с интернетом", 0);
}

class TimeoutException extends ApiException {
  TimeoutException() : super("Время ожидания истекло", 408);
}

class ConnectionException extends ApiException {
  ConnectionException() : super("Время подключения истекло", 0);
}

class SendTimeoutException extends ApiException {
  SendTimeoutException() : super("Время отправки истекло", -1);
}

class ServerException extends ApiException {
  final dynamic responseData;
  final int status;

  ServerException(this.status, {
    required String message,
    this.responseData,
  }) : super("Ошибка сервера: $message", status);
}

class CancelledRequestException extends ApiException {
  CancelledRequestException() : super("Запрос отменён", 499);
}

class UnknownApiException extends ApiException {
  UnknownApiException([String? message] )
      : super(message ?? 'Что-то пошло не так', 520);
}

class ParseDataException extends ApiException {
  ParseDataException() : super("Ошибка парсинга данных", -1);
}

class BadRequestException extends ApiException {
  BadRequestException([String message = "Неверный формат запроса"])
      : super(message, 400);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String message = "Неавторизованный доступ"])
      : super(message, 401);
}

class NotFoundException extends ApiException {
  NotFoundException([String message = "Ресурс не найден"])
      : super(message, 404);
}
