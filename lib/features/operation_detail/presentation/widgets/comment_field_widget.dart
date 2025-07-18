import 'package:finance_hunter_app/features/operation_detail/presentation/utils/index.dart';

class CommentFieldWidget extends StatelessWidget {
  final String comment;
  final TextEditingController commentController;
  final bool isSaving;

  const CommentFieldWidget({
    super.key,
    required this.comment,
    required this.commentController,
    required this.isSaving,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: TextField(
        controller: commentController,
        readOnly: isSaving,
        decoration: InputDecoration(
          hintText: s.comments,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 7),
        ),
      ),
    );
  }
}
