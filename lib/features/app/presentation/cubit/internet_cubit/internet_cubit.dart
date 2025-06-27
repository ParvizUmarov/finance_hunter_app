import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { online, offline }

class InternetStatusCubit extends Cubit<InternetStatus> {
  final Connectivity _connectivity;
  late final Stream<List<ConnectivityResult>> _subscription;

  InternetStatusCubit(this._connectivity) : super(InternetStatus.online) {
    _subscription = _connectivity.onConnectivityChanged;
    _subscription.listen(_updateStatus);
    _init();
  }

  void _init() async {
    final result = await _connectivity.checkConnectivity();
    _updateStatus(result);
  }

  void _updateStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      emit(InternetStatus.offline);
    } else {
      emit(InternetStatus.online);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
