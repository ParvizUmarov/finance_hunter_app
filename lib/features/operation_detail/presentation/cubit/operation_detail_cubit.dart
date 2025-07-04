import 'dart:developer';

import 'package:bloc/bloc.dart';
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
  TransactionKind _kind = IncomeTransaction();

  TransactionModel? _initialModel;

  List<CategoryModel> _categories = [];
  List<AccountModel> _accounts = [];

  Future<void> init(
    TransactionKind kind,
    TransactionModel? initialModel,
  ) async {
    _kind = kind;
    _initialModel = initialModel;
    emit(const OperationDetailState.loading());

    await _getBankAccounts();
    await _getCategories();

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
      emit(
        state.copyWith(
          fields: state.fields.copyWith(amount: amount),
          errorMessage: null,
        ),
      );
    }
  }

  Future<void> submit() async {
    final s = state;
    if (s is! OperationDetailReady) return;

    if (!s.fields.isValid) {
      emit(s.copyWith(errorMessage: s.fields.validationError));
      return;
    }

    emit(s.copyWith(isSaving: true, errorMessage: null));

    if (s.isEditMode) {
      await _transactionRepository.updateTransaction(
        transactionId: 0,
        requestBody: TransactionRequestBody(
          accountId: s.fields.account?.id ?? 0,
        ),
        result: Result(
          onSuccess: (response) {
            emit(const OperationDetailState.saved());
          },
          onError: (message) {
            emit(
              s.copyWith(
                isSaving: false,
                errorMessage: 'Ошибка обновления: $message',
              ),
            );
          },
        ),
      );
    } else {
      await _transactionRepository.addTransaction(
        requestBody: TransactionRequestBody(
          accountId: s.fields.account?.id ?? 0,
        ),
        result: Result(
          onSuccess: (response) {
            emit(const OperationDetailState.saved());
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

  Future<void> _getCategories() async {
    if (_categories.isEmpty) {
      await _categoryRepository.getListOfAllCategories(
        Result(
          onSuccess: (response) {
            _categories = response;
          },
          onError: (message) {},
        ),
      );
    }
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
