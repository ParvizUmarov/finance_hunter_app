import 'package:finance_hunter_app/features/app/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/cash_flow/domain/models/transaction/account_model.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class OperationDetailScreenBody extends StatelessWidget {
  final TransactionKind kind;
  final TextEditingController amountController;
  final TextEditingController commentController;

  const OperationDetailScreenBody({
    super.key,
    required this.kind,
    required this.amountController,
    required this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OperationDetailCubit, OperationDetailState>(
      listener: (BuildContext context, OperationDetailState state) {
        if (state is OperationDetailReady) {
          amountController.value = amountController.value.copyWith(
            text: state.fields.amount,
          );
          commentController.value = commentController.value.copyWith(
            text: state.fields.comment,
          );

          if (state.errorMessage != null) {
            _showErrorAlert(context, state.errorMessage!);
          }
        }

        if (state is OperationDetailSaved) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state is OperationDetailLoading) {
          return CustomShimmer(type: ShimmerType.categoriesList);
        } else if (state is OperationDetailReady) {
          final model = state.fields;
          amountController.text = model.amount;
          commentController.text = model.comment;

          return ListView(
            children: [
              CustomListTile(
                title: "Счет",
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
                title: "Статья",
                addTrailing: true,
                data: model.category?.name,
                onTap: () {
                  _showCategoryBottomSheet(
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
                title: "Сумма",
                child: AmountTextField(controller: amountController),
              ),
              CustomListTile(
                title: "Дата",
                data: CustomDateFormatter.formatDate(model.date),
                onTap: () async {
                  await customShowDatePicker(
                    context: context,
                    initialDate: model.date,
                    onSelectedDate: (date) {
                      context.read<OperationDetailCubit>().changeDate(date);
                    },
                  );
                },
              ),
              CustomListTile(
                title: "Время",
                data: CustomDateFormatter.formatTimeOfDay(model.time),
                onTap: () async {
                  await customShowTimePicker(
                    context: context,
                    initialDate: model.time,
                    onSelectedTime: (TimeOfDay time) {
                      context.read<OperationDetailCubit>().changeTime(time);
                    },
                  );
                },
              ),
              CommentFieldWidget(
                comment: model.comment,
                commentController: commentController,
              ),
              const SizedBox(height: 10),
              DeleteOperationButton(kind: kind),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  void _showErrorAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(title: Text("Заполните"), content: Text(message));
      },
    );
  }

  Future<void> _showCategoryBottomSheet(
    BuildContext context,
    ValueChanged<CategoryModel> onSelect,
    List<CategoryModel> categories,
    CategoryModel? selectedCategory,
  ) async {
    final selected = await showModalBottomSheet<CategoryModel>(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          snap: true,
          expand: false,
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (_, controller) {
            return ListView(
              controller: controller,
              children: categories
                  .map(
                    (category) => ListTile(
                      title: Text(category.name),
                      onTap: () => context.pop(category),
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
    if (selected != null) {
      onSelect(selected);
    }
  }
}
