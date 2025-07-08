import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finance_hunter_app/core/datasource/remote/deserializers/response_deserializers.dart';
import 'package:worker_manager/worker_manager.dart';

class IsolateDeserializeInterceptor extends Interceptor {
  IsolateDeserializeInterceptor(this.deserializers);

  final ResponseDeserializers deserializers;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final path = response.requestOptions.path;

    Future<dynamic> deserializer(String path, dynamic data) async {
      if (path.startsWith('transactions/account/')) {
        return deserializers.transactionList(data);
      } else if (path.startsWith('transactions/')) {
        return deserializers.transactionResponse(data);
      } else if (path.startsWith('/categories/')) {
        return deserializers.categoryList(data);
      }
      return data;
    }

    try {
      final deserialized = await workerManager.execute(
        () => deserializer(path, response.data),
      );

      final newResponse = Response(
        requestOptions: response.requestOptions,
        data: deserialized,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
      );

      handler.next(newResponse);
    } catch (e) {
      log("IsolateDeserializeInterceptor exception: $e");
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: e,
          response: response,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}
