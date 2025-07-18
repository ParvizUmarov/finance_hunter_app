import 'package:finance_hunter_app/features/account/domain/models/bank_account/bank_account_model.dart';
import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/data/models/response/transaction_response_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/transaction_model.dart';

class ResponseDeserializers {
  List<TransactionModel> transactionList(dynamic data) {
    final List list = data as List;
    return list.map((e) => TransactionModel.fromJson(e)).toList();
  }

  TransactionResponseModel transactionResponse(dynamic data) {
    return TransactionResponseModel.fromJson(data);
  }

  TransactionModel transactionModel(dynamic data) {
    return TransactionModel.fromJson(data);
  }

  List<CategoryModel> categoryList(dynamic data) {
    final List list = data as List;
    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }

  List<BankAccountModel> accountsList(dynamic data) {
    final List list = data as List;
    return list.map((e) => BankAccountModel.fromJson(e)).toList();
  }
}
