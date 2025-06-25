import 'package:finance_hunter_app/features/detail_category/presentation/utils/index.dart';

class DetailCategoryScreen extends StatelessWidget {
  final GroupedTransactionModel transactionModel;

  static const String screenName = "detailCategoryScreen";

  const DetailCategoryScreen({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(transactionModel.category.name),
      ),
      body: DetailCategoryBody(transactionModel: transactionModel,),
    );
  }
}
