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
  OperationDetailCubit(
    this.kind, {
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
  final TransactionKind kind;

  List<CategoryModel> _categories = [];
  List<AccountModel> _accounts = [];

  Future<void> create() async {
    emit(
      OperationDetailState.ready(
        kind: kind,
        isEditMode: false,
        fields: OperationFormFields(
          account: null,
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

  Future<void> edit(TransactionModel model) async {
    emit(
      OperationDetailState.ready(
        kind: kind,
        isEditMode: true,
        fields: OperationFormFields(
          account: model.account,
          category: model.category,
          amount: model.amount,
          date: model.transactionDate,
          time: TimeOfDay.fromDateTime(model.transactionDate),
          comment: model.comment ?? '',
        ),
        accounts: _accounts,
        categories: _categories,
      ),
    );
  }

  void changeAccount(AccountModel account) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(state.copyWith(fields: state.fields.copyWith(account: account)));
    }
  }

  void changeCategory(CategoryModel category) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(state.copyWith(fields: state.fields.copyWith(category: category)));
    }
  }

  void changeDate(DateTime date) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(state.copyWith(fields: state.fields.copyWith(date: date)));
    }
  }

  void changeTime(TimeOfDay time) {
    final state = this.state;
    if (state is OperationDetailReady) {
      emit(state.copyWith(fields: state.fields.copyWith(time: time)));
    }
  }

  Future<void> submit(String comment, String amount) async {
    final s = state;
    if (s is! OperationDetailReady) return;

    if (!s.fields.isValid) {
      emit(s.copyWith(errorMessage: 'Заполните все поля'));
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
                errorMessage: 'Ошибка сохранения: $message',
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

  Future<void> initData() async {
    emit(OperationDetailState.loading());

    await _getBankAccounts();
    await _getCategories();

    final currentFields = (state is OperationDetailReady)
        ? (state as OperationDetailReady).fields
        : OperationFormFields(
      account: null,
      category: null,
      amount: '0',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      comment: '',
    );

    emit(
      OperationDetailState.ready(
        kind: kind,
        isEditMode: state is OperationDetailReady ? (state as OperationDetailReady).isEditMode : false,
        fields: currentFields,
        accounts: _accounts,
        categories: _categories,
      ),
    );
  }

  Future<void> _getBankAccounts() async {
    if (_accounts.isEmpty) {
      await _bankAccountRepository.getUserAccounts(
        result: Result(
          onSuccess: (response) {
            _accounts = response.map((b) => _toAccountModel(b)).toList();
            log("account: $_accounts");
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
