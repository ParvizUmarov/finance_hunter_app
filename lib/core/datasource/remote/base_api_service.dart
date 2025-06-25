import 'dart:io';
import 'package:dio/dio.dart';

abstract class BaseApiService {
  final Dio dio;

  BaseApiService(this.dio);

  Future<void> safeRequest<T>({
    required Future<T> Function() request,
    required void Function(T data) onSuccess,
    required void Function(String error) onError,
  }) async {
    try {
      final data = await request();
      onSuccess(data);
    } on DioException catch (e) {
      onError(_handleDioError(e));
    } on SocketException {
      onError("Нет соединения с интернетом");
    } on FormatException {
      onError("Ошибка парсинга данных");
    } catch (e) {
      onError("Неизвестная ошибка: $e");
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Время подключения истекло";
      case DioExceptionType.receiveTimeout:
        return "Время ожидания ответа истекло";
      case DioExceptionType.sendTimeout:
        return "Время отправки истекло";
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;
        return "Ошибка сервера: [$statusCode] $data";
      case DioExceptionType.cancel:
        return "Запрос отменён";
      case DioExceptionType.unknown:
      default:
        return "Произошла ошибка: ${e.message}";
    }
  }
}
