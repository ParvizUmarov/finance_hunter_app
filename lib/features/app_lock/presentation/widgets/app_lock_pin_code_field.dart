import 'dart:async';

import 'package:finance_hunter_app/features/app_lock/presentation/utils/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppLockPinCodeField extends StatelessWidget {
  final TextEditingController textEditingController;
  final StreamController<ErrorAnimationType>? errorController;
  final ValueChanged<String>? onCompleted;

  const AppLockPinCodeField({
    super.key,
    this.onCompleted,
    required this.textEditingController,
    this.errorController,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: 4,
      obscureText: true,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: Colors.grey,
        inactiveFillColor: Colors.transparent,
        selectedColor: Theme.of(context).primaryColor,
        selectedFillColor: Colors.transparent,
        inactiveColor: LightAppColors.outline,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.transparent,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      onChanged: (value) {},
    );
  }
}
