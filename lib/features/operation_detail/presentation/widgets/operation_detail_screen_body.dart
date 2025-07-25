import 'dart:developer';

import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/account_model.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreenBody extends StatelessWidget {
  final TransactionKind kind;
  final TextEditingController amountController;
  final TextEditingController commentController;
  final TransactionModel? transactionModel;
  final Function() onSuccess;

  const OperationDetailScreenBody({
    super.key,
    required this.kind,
    required this.amountController,
    required this.commentController,
    this.transactionModel,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<OperationDetailCubit, OperationDetailState>(
      listener: (BuildContext context, OperationDetailState state) {
        if (state is OperationDetailReady) {
          _handleReadyState(context, state);
        } else if (state is OperationDetailSaved) {
          _handleSavedState(context, state);
        } else if (state is OperationDetailDeleted) {
          _handleDeletedState(context, state);
        }
      },
      builder: (context, state) {
        if (state is OperationDetailLoading) {
          return CustomShimmer(type: ShimmerType.categoriesList);
        } else if (state is OperationDetailReady) {
          final model = state.fields;
          final isSaving = state.isSaving;
          amountController.text = model.amount;
          commentController.text = model.comment;

          return ListView(
            children: [
              CustomListTile(
                title: s.account,
                addTrailing: true,
                child: DropdownButton<AccountModel>(
                  isExpanded: true,
                  isDense: true,
                  alignment: Alignment.centerRight,
                  value: state.fields.account,
                  underline: SizedBox(),
                  icon: SizedBox.shrink(),
                  items: state.accounts
                      .map(
                        (a) => DropdownMenuItem(
                          value: a,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(a.name),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (a) {
                    if (a != null) {
                      context.read<OperationDetailCubit>().changeAccount(a);
                    }
                  },
                ),
              ),
              CustomListTile(
                title: s.article,
                addTrailing: true,
                data: model.category?.name,
                onTap: isSaving
                    ? null
                    : () {
                        showCategoryBottomSheet(
                          context,
                          (selectedCategory) {
                            context.read<OperationDetailCubit>().changeCategory(
                              selectedCategory,
                            );
                          },
                          state.categories,
                          model.category,
                        );
                      },
              ),
              CustomListTile(
                title: s.amount,
                child: AmountTextField(
                  controller: amountController,
                ),
              ),
              CustomListTile(
                title: s.date,
                data: CustomDateFormatter.formatDate(model.date),
                onTap: isSaving
                    ? null
                    : () async {
                        await customShowDatePicker(
                          context: context,
                          initialDate: model.date,
                          onSelectedDate: (date) {
                            context.read<OperationDetailCubit>().changeDate(
                              date,
                            );
                          },
                        );
                      },
              ),
              CustomListTile(
                title: s.time,
                data: CustomDateFormatter.formatTimeOfDay(model.time),
                onTap: isSaving
                    ? null
                    : () async {
                        await customShowTimePicker(
                          context: context,
                          initialDate: model.time,
                          onSelectedTime: (TimeOfDay time) {
                            context.read<OperationDetailCubit>().changeTime(
                              time,
                            );
                          },
                        );
                      },
              ),
              CommentFieldWidget(
                comment: model.comment,
                commentController: commentController,
                isSaving: isSaving,
              ),
              const SizedBox(height: 10),
              DeleteOperationButton(
                kind: kind,
                isSaving: isSaving,
                transaction: transactionModel,
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  void _handleReadyState(BuildContext context, OperationDetailReady state) {
    amountController.value = amountController.value.copyWith(
      text: state.fields.amount,
    );
    commentController.value = commentController.value.copyWith(
      text: state.fields.comment,
    );

    if (state.errorMessage != null) {
      showErrorAlert(context, state.errorMessage!);
    }
  }

  void _handleSavedState(BuildContext context, OperationDetailSaved state) {
    final s = S.of(context);
    context.pop();

    final message = state.isEditSaved
        ? s.transactionUpdated
        : s.transactionCreated;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    onSuccess();
  }

  void _handleDeletedState(BuildContext context, OperationDetailDeleted state) {
    if (state.isEditMode) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).transactionDeleted)));
    }

    context.pop();
    onSuccess();
  }
}
