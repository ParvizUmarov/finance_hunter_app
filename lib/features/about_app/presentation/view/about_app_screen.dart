import 'package:finance_hunter_app/features/about_app/presentation/utils/index.dart';

class AboutAppScreen extends StatelessWidget {
  static const String screenName = "aboutAppScreen";

  const AboutAppScreen({super.key});

  Future<String> _getVersion() async {
    final info = await PackageInfo.fromPlatform();
    return '${info.version} (${info.buildNumber})';
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return OfflineAwareScaffold(
      appBar: AppBar(title: Text(s.aboutProgram)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Assets.images.launchIcon.image()),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Finance Hunter",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 8),
            FutureBuilder<String>(
              future: _getVersion(),
              builder: (context, snapshot) {
                return Text(
                  "${s.version} ${snapshot.data}" ?? '',
                  style: const TextStyle(color: Colors.grey),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              s.aboutProgram,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(s.aboutAppText),
          ],
        ),
      ),
    );
  }
}
