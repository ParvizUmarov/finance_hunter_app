import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';
import 'package:flutter/foundation.dart';

class ErrorBaseWidget extends StatelessWidget {
  final String? errorMessage;
  final bool isDebugMode;

  const ErrorBaseWidget({
    super.key,
    this.errorMessage,
    this.isDebugMode = kDebugMode,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.error.image(),
            const SizedBox(height: 10),
            isDebugMode
                ? Text("Ошибка: $errorMessage", overflow: TextOverflow.ellipsis)
                : Text("Что-то пошло не так"),
          ],
        ),
      ),
    );
  }
}
