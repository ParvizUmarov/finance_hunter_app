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
    final method = response.requestOptions.method;

    Future<dynamic> deserializer(String path, String method, dynamic data) async {
      if (path.startsWith('transactions/account/')) {
        return deserializers.transactionList(data);
      } else if (path.startsWith('transactions')) {
        if(method == "GET"){
          return deserializers.transactionResponse(data);
        } else if(method == "POST"){
          return deserializers.transactionResponse(data);
        }else if(method == "PUT"){
          log("put transaction");
          return deserializers.transactionModel(data);
        } else if (method == 'DELETE') {
          return null;
        }
      } else if (path.startsWith('categories')) {
        return deserializers.categoryList(data);
      } else if (path.startsWith('accounts')) {
        return deserializers.accountsList(data);
      }
      return data;
    }

    try {
      final deserialized = await workerManager.execute(
        () => deserializer(path, method, response.data),
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
