import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration baseDelay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.baseDelay = const Duration(seconds: 1),
  });

  static const List<int> retryableStatusCodes = [500, 502, 503, 504, 408, 429];

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final RequestOptions requestOptions = err.requestOptions;
    final int retryCount = requestOptions.extra['retry_count'] ?? 0;
    final int? statusCode = err.response?.statusCode;

    final bool shouldRetry =
        statusCode != null &&
        retryableStatusCodes.contains(statusCode) &&
        retryCount < maxRetries;

    if (shouldRetry) {
      final int nextRetry = retryCount + 1;
      final int delayMs =
          baseDelay.inMilliseconds * pow(2, nextRetry - 1).toInt();
      final jitter = Random().nextInt(1000);
      final totalDelay = Duration(milliseconds: delayMs + jitter);

      dev.log(
        'Retry #$nextRetry after ${totalDelay.inMilliseconds}ms → ${requestOptions.uri}',
      );

      await Future.delayed(totalDelay);

      try {
        final clone = requestOptions.copyWith(
          extra: {...requestOptions.extra, 'retry_count': nextRetry},
        );
        final response = await dio.fetch(clone);
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }
}
