import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class DeleteOperationButton extends StatelessWidget {
  const DeleteOperationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
        onPressed: () {},
        child: Text("Удалить расход"),
      ),
    );
  }
}
