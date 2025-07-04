import 'package:finance_hunter_app/features/articles/domain/models/category_model.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_hunter_app/core/core.dart';

part 'operation_form_fields.freezed.dart';

@freezed
abstract class OperationFormFields with _$OperationFormFields {
  const factory OperationFormFields({
    required AccountModel? account,
    required CategoryModel? category,
    required String amount,
    required DateTime date,
    required TimeOfDay time,
    required String comment,
  }) = _OperationFormFields;
}

extension OperationFormFieldsX on OperationFormFields {
  String? get validationError {
    final errors = <String>[];

    if (account == null) {
      errors.add('Счет не выбран');
    }

    if (category == null) {
      errors.add('Категория не выбрана');
    }

    final parsedAmount = double.tryParse(amount);
    if (parsedAmount == null || parsedAmount <= 0) {
      errors.add('Некорректная сумма');
    }

    if (comment.trim().isEmpty) {
      errors.add('Комментарий пустой');
    }

    return errors.isEmpty ? null : errors.join('\n');
  }

  bool get isValid => validationError == null;
}

