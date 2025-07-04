import 'package:finance_hunter_app/features/cash_flow/domain/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { online, offline }

class InternetStatusCubit extends Cubit<InternetStatus> {
  final Connectivity _connectivity;
  late final Stream<List<ConnectivityResult>> _subscription;
  final TransactionRepository _transactionRepository;

  InternetStatusCubit(
    this._connectivity,
    TransactionRepository transactionRepository,
  ) : _transactionRepository = transactionRepository,
      super(InternetStatus.online) {
    _subscription = _connectivity.onConnectivityChanged;
    _subscription.listen(_handleConnectivityChange);
    _init();
  }

  void _init() async {
    final result = await _connectivity.checkConnectivity();
    _handleConnectivityChange(result);
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      emit(InternetStatus.offline);
    } else {
      ///Как только подключимся к интернету сразу что синхронизируемся
      //_transactionRepository.syncPending();
      emit(InternetStatus.online);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
