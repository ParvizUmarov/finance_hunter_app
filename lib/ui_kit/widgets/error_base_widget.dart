import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 40,),
            SizedBox(height: 10),
            isDebugMode
                ? Text("Ошибка: $errorMessage", overflow: TextOverflow.ellipsis)
                : Text("Что-то пошло не так"),
          ],
        ),
      ),
    );
  }
}
