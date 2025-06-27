import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:finance_hunter_app/core/core.dart';

abstract class BaseApiService {
  final Dio dio;

  BaseApiService(this.dio);

  Future<void> safeRequest<T>({
    required Future<T> Function() request,
    required void Function(T data) onSuccess,
    required void Function(Exception error) onError,
  }) async {
    try {
      await checkInternetConnection();
      final data = await request();
      onSuccess(data);
    } on DioException catch (e) {
      onError(_handleDioError(e));
    } on SocketException {
      onError(NoInternetException());
    } on FormatException {
      onError(ParseDataException());
    } on NoInternetException {
      onError(NoInternetException());
    } catch (e) {
      onError(UnknownApiException(e.toString()));
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ConnectionException();
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.sendTimeout:
        return SendTimeoutException();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;
        return ServerException(statusCode: statusCode, message: data);
      case DioExceptionType.cancel:
        return CancelledRequestException();
      case DioExceptionType.unknown:
      default:
        return UnknownApiException(e.message);
    }
  }

  Future<void> checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    log("network status: $connectivityResult");

    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }
  }
}
