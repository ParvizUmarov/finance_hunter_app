part of 'operation_detail_cubit.dart';

@freezed
class OperationDetailState with _$OperationDetailState {
  const factory OperationDetailState.initial() = OperationDetailInitial;

  const factory OperationDetailState.loading() = OperationDetailLoading;

  const factory OperationDetailState.ready({
    required TransactionKind kind,
    required OperationFormFields fields,
    required bool isEditMode,
    required List<AccountModel> accounts,
    required List<CategoryModel> categories,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = OperationDetailReady;

  const factory OperationDetailState.saved({required bool isEditSaved}) =
      OperationDetailSaved;

  const factory OperationDetailState.delete({required bool isEditMode}) =
      OperationDetailDeleted;

  const factory OperationDetailState.error({required String message}) =
      OperationDetailError;
}
