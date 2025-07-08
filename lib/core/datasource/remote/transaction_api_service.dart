import 'dart:convert';

import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';

class TransactionApiServiceImpl extends BaseApiService
    implements TransactionApiService {
  TransactionApiServiceImpl(super.dio);

  @override
  Future<void> addTransaction({
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await safeRequest(
      request: () async {
        final response = await dio.post(
          'transactions',
          data: requestBody.toJson(),
        );
        return TransactionResponseModel.fromJson(response.data);
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> getTransactionByPeriod({
    required int accountId,
    required TransactionPeriodRequestBody requestBody,
    required Result<List<TransactionModel>> result,
  }) async {
    await safeRequest<List<TransactionModel>>(
      request: () async {
        final response = await dio.get(
          'transactions/account/$accountId/period',
          queryParameters: requestBody.toJson(),
        );
        final List data = response.data as List;
        return data.map((e) => TransactionModel.fromJson(e)).toList();
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> deleteTransaction({
    required int transactionId,
    required Result<void> result,
  }) async {
    await safeRequest(
      request: () async {
        await dio.delete('transactions/$transactionId');
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> getTransactionById({
    required int transactionId,
    required Result<TransactionModel> result,
  }) async {
    await safeRequest<TransactionModel>(
      request: () async {
        final response = await dio.get('transactions/$transactionId');
        return TransactionModel.fromJson(response.data);
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }

  @override
  Future<void> updateTransaction({
    required int transactionId,
    required TransactionRequestBody requestBody,
    required Result<TransactionResponseModel> result,
  }) async {
    await safeRequest(
      request: () async {
        final response = await dio.put(
          'transactions/$transactionId',
          data: requestBody.toJson(),
        );
        return TransactionResponseModel.fromJson(response.data);
      },
      onSuccess: result.onSuccess,
      onError: result.onError,
    );
  }
}
