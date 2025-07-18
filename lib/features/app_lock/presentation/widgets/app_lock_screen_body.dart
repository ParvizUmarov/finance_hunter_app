import 'dart:async';

import 'package:finance_hunter_app/features/app_lock/data/app_lock_status.dart';
import 'package:finance_hunter_app/features/app_lock/presentation/utils/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppLockScreenBody extends StatefulWidget {
  final AppLockStatus appLockStatus;
  final String? errorMessage;

  const AppLockScreenBody({
    super.key,
    required this.appLockStatus,
    this.errorMessage,
  });

  @override
  State<AppLockScreenBody> createState() => _AppLockScreenBodyState();
}

class _AppLockScreenBodyState extends State<AppLockScreenBody> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.appLockStatus is RetryPinCodeStatus) {
      textEditingController.text = '';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Assets.images.lock.image(height: 50),
          const SizedBox(height: 20),
          Text(
            widget.appLockStatus.title(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            widget.appLockStatus.text(context),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          AppLockPinCodeField(
            onCompleted: (value) async {
              await widget.appLockStatus.onConfirm(context, value);
            },
            textEditingController: textEditingController,
            errorController: errorController,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
