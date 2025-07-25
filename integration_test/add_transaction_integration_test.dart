import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';
import 'package:finance_hunter_app/features/features.dart';
import 'package:finance_hunter_app/features/operation_detail/presentation/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  patrolTest('добавление транзакции', ($) async {
    await dotenv.load();
    final IDataBase iDataBase = FakeDatabase();
    await iDataBase.init();

    final AppDependencies appDependencies = AppDependencies(
      iDataBase: iDataBase,
      transactionRepository: TransactionRepositoryImpl(
        transactionApiService: TransactionApiServiceTestImpl(),
        localDb: TransactionLocalDatasourceTestImpl(
          mapper: TransactionModelMapper(),
        ),
      ),
    );

    await $.pumpWidgetAndSettle(
      AppScreen(dependencies: appDependencies, iDataBase: iDataBase),
    );

    await $.tap(find.byType(FloatingActionButton));
    await $.pumpAndSettle();

    await $.tap(find.textContaining('Статья'));
    await $.pumpAndSettle();

    await $.tap(find.text('Продукты'));
    await $.pumpAndSettle();

    final amountTextFieldFinder = find.descendant(
      of: find.byType(AmountTextField),
      matching: find.byType(TextField),
    );
    await $.enterText(amountTextFieldFinder, '1000');

    await $.enterText(find.byType(CommentFieldWidget), "Some comment");

    await $.tap(find.byIcon(Icons.check));
    await $.pumpAndSettle();
  });
}
