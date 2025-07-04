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
      errors.add('Пожалуйста, выберите счёт.');
    }

    if (category == null) {
      errors.add('Пожалуйста, выберите категорию операции.');
    }

    final parsedAmount = double.tryParse(amount);
    if (parsedAmount == null || parsedAmount <= 0) {
      errors.add('Введите корректную сумму больше нуля.');
    }

    return errors.isEmpty ? null : errors.map((e) => '• $e').join('\n');
  }
}
