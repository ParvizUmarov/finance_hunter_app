import 'package:finance_hunter_app/features/analysis/presentation/utils/index.dart';

class AnalysisScreen extends StatelessWidget {
  final TransactionKind kind;
  static const String screenName = "analysisScreen";

  const AnalysisScreen({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(s.analysis),
      ),
      body: AnalysisScreenBody(),
    );
  }
}
