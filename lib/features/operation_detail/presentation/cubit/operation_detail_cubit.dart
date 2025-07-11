import 'dart:developer';

import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/data/data.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/domain.dart';
import 'package:finance_hunter_app/features/operation_detail/domain/models/operation_form_fields.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_detail_state.dart';

part 'operation_detail_cubit.freezed.dart';

class OperationDetailCubit extends Cubit<OperationDetailState> {
  OperationDetailCubit({
    required TransactionRepository transactionRepository,
    required CategoryRepository categoryRepository,
    required BankAccountRepository bankAccountRepository,
  }) : _transactionRepository = transactionRepository,
       _categoryRepository = categoryRepository,
       _bankAccountRepository = bankAccountRepository,
       super(const OperationDetailState.initial());

  final TransactionRepository _transactionRepository;
  final CategoryRepository _categoryRepository;
  final BankAccountRepository _bankAccountRepository;

  TransactionModel? _initialModel;

  List<CategoryModel> _categories = [];
  List<AccountModel> _accounts = [];

  Future<void> init(
    TransactionKind kind,
    TransactionModel? initialModel,
  ) async {
    _initialModel = initialModel;
    emit(const OperationDetailState.loading());

    await _getBankAccounts();
    await _getCategories(kind);

    if (_initialModel != null) {
      final account =
          (_accounts
              .where((a) => a.id == _initialModel?.category.id)
              .singleOrNull) ??
          _accounts.first;

      emit(
        OperationDetailState.ready(
          kind: kind,
          isEditMode: true,
          fields: OperationFormFields(
            account: account,
            category: initialModel!.category,
            amount: initialModel.amount,
            date: initialModel.transactionDate,
            time: TimeOfDay.fromDateTime(initialModel.transactionDate),
            comment: initialModel.comment ?? '',
          ),
          accounts: _accounts,
          categories: _categories,
        ),
      );
    } else {
      emit(
        OperationDetailState.ready(
          kind: kind,
          isEditMode: false,
          fields: OperationFormFields(
            account: _accounts.isEmpty ? null : _accounts.first,
            category: null,
            amount: '0',
            date: DateTime.now(),
            time: TimeOfDay.now(),
            comment: '',
          ),
          accounts: _accounts,
          categories: _categories,
        ),
      );
    }
  }

  void changeAccount(AccountModel account) {
    final state = this.state;
    if (state is OperationDetailReady) {
      if (state.isSaving) return;

      emit(
        state.copyWith(
          fields: state.fields.copyWith(account: account),
          errorMessage: null,
        ),
      );
    }
  }

  void changeCategory(CategoryModel category) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(
        state.copyWith(
          fields: state.fields.copyWith(category: category),
          errorMessage: null,
        ),
      );
    }
  }

  void changeDate(DateTime date) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(
        state.copyWith(
          fields: state.fields.copyWith(date: date),
          errorMessage: null,
        ),
      );
    }
  }

  void changeTime(TimeOfDay time) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(
        state.copyWith(
          fields: state.fields.copyWith(time: time),
          errorMessage: null,
        ),
      );
    }
  }

  void changeComment(String comment) {
    final state = this.state;
    if (state is OperationDetailReady) {
      if (state.isSaving) return;
      emit(
        state.copyWith(
          fields: state.fields.copyWith(comment: comment),
          errorMessage: null,
        ),
      );
    }
  }

  void changeAmount(String amount) {
    final state = this.state;

    if (state is OperationDetailReady) {
      if (state.isSaving) return;

      emit(
        state.copyWith(
          fields: state.fields.copyWith(amount: amount),
          errorMessage: null,
        ),
      );
    }
  }

  void cleanErrorState() {
    final s = state;
    if (s is! OperationDetailReady) return;

    if (s.fields.validationError != null) {
      emit(s.copyWith(errorMessage: null));
    }
  }

  Future<void> submit(TransactionModel? transaction) async {
    final s = state;
    if (s is! OperationDetailReady) return;

    if (s.isSaving) return;

    if (s.fields.validationError != null) {
      emit(s.copyWith(errorMessage: s.fields.validationError));
      return;
    }

    emit(s.copyWith(isSaving: true, errorMessage: null));

    final transactionDate = CustomDateFormatter.combineDateAndTime(
      s.fields.date,
      s.fields.time,
    );

    if (s.isEditMode) {
      final model = TransactionModel(
        id: transaction?.id ?? 0,
        localId: transaction?.localId,
        account: s.fields.account!,
        category: s.fields.category!,
        amount: s.fields.amount,
        transactionDate: transactionDate,
        comment: s.fields.comment,
        createdAt: transaction?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _transactionRepository.updateTransaction(
        model: model,
        result: Result(
          onSuccess: (response) {
            emit(const OperationDetailState.saved(isEditSaved: true));
          },
          onError: (message) {
            emit(s.copyWith(isSaving: false, errorMessage: message.toString()));
          },
        ),
      );
    } else {
      final model = TransactionModel(
        id: -1,
        account: s.fields.account!,
        category: s.fields.category!,
        amount: s.fields.amount,
        transactionDate: transactionDate,
        comment: s.fields.comment,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _transactionRepository.addTransaction(
        model: model,
        result: Result(
          onSuccess: (response) {
            emit(const OperationDetailState.saved(isEditSaved: false));
          },
          onError: (message) {
            emit(
              s.copyWith(
                isSaving: false,
                errorMessage: 'Ошибка сохранения: $message',
              ),
            );
          },
        ),
      );
    }
  }

  Future<void> delete(TransactionModel? transaction) async {
    final s = state;
    if (s is! OperationDetailReady) return;

    if (s.isSaving) return;

    emit(s.copyWith(isSaving: true, errorMessage: null));

    if (transaction != null) {
      await _transactionRepository.deleteTransaction(
        transaction: transaction,
        result: Result(
          onSuccess: (response) {
            emit(OperationDetailState.delete(isEditMode: true));
          },
          onError: (message) {
            emit(
              s.copyWith(
                isSaving: false,
                errorMessage: "Ошибка при удалении транзакции",
              ),
            );
          },
        ),
      );
    } else {
      emit(OperationDetailState.delete(isEditMode: false));
    }
  }

  Future<void> _getCategories(TransactionKind kind) async {
    await _categoryRepository.getListOfCategoriesByType(
      kind is IncomeTransaction,
      Result(
        onSuccess: (response) {
          _categories = response;
          final current = state;
          if (current is OperationDetailReady) {
            emit(current.copyWith(categories: response));
          }
        },
        onError: (message) {},
      ),
    );
  }

  Future<void> _getBankAccounts() async {
    if (_accounts.isEmpty) {
      await _bankAccountRepository.getUserAccounts(
        result: Result(
          onSuccess: (response) {
            _accounts = response.map((b) => _toAccountModel(b)).toList();
          },
          onError: (message) {},
        ),
      );
    }
  }

  AccountModel _toAccountModel(BankAccountModel model) {
    return AccountModel(
      id: model.id,
      name: model.name,
      balance: model.balance,
      currency: model.currency,
    );
  }
}
