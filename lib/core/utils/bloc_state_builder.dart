import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/ui_kit/ui_kit.dart';

typedef StateWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef StateWidgetBuilderWithoutData = Widget Function(BuildContext context);

typedef WhenFunc<S> =
    Widget Function({
      required Widget Function() initial,
      required Widget Function() loading,
      required Widget Function(dynamic data) success,
      required Widget Function(String message) error,
    });

class BlocStateBuilder<C extends Cubit<S>, S> extends StatelessWidget {
  final C cubit;

  final Widget Function(BuildContext context)? onInitial;
  final StateWidgetBuilderWithoutData? onLoading;
  final StateWidgetBuilder<dynamic>? onSuccess;
  final StateWidgetBuilder<String>? onError;

  final WhenFunc<S> whenState;

  const BlocStateBuilder({
    super.key,
    required this.cubit,
    required this.whenState,
    this.onInitial,
    this.onLoading,
    this.onSuccess,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      bloc: cubit,
      builder: (context, state) {
        return whenState(
          initial: () => onInitial?.call(context) ?? const SizedBox(),
          loading: () =>
              onLoading?.call(context) ?? const CircularProgressIndicator(),
          success: (data) =>
              onSuccess?.call(context, data) ?? Center(child: Text('Success')),
          error: (message) =>
              onError?.call(context, message) ??
              ErrorBaseWidget(errorMessage: message),
        );
      },
    );
  }
}
