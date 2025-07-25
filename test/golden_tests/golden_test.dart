import 'package:alchemist/alchemist.dart';
import 'package:finance_hunter_app/core/core.dart';
import 'package:finance_hunter_app/features/analysis/presentation/widgets/date_time_container.dart';
import 'package:finance_hunter_app/ui_kit/widgets/custom_list_tile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomListTile Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'custom_list_tile',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 1280),
        children: [
          GoldenTestScenario(
            name: 'with title',
            child: const CustomListTile(title: "Зарплата"),
          ),
          GoldenTestScenario(
            name: 'with title and emoji',
            child: const CustomListTile(title: "Зарплата", emoji: "💰"),
          ),
          GoldenTestScenario(
            name: 'with trailing icon',
            child: const CustomListTile(
              title: "Зарплата",
              emoji: "💰",
              addTrailing: true,
            ),
          ),
          GoldenTestScenario(
            name: 'with data',
            child: const CustomListTile(
              title: "Зарплата",
              emoji: "💰",
              addTrailing: true,
              data: "2000.00",
            ),
          ),
          GoldenTestScenario(
            name: 'with child',
            child: CustomListTile(
              title: "Период: начало",
              child: DateTimeContainer(date: DateTime.now()),
            ),
          ),
        ],
      ),
    );
  });
}
