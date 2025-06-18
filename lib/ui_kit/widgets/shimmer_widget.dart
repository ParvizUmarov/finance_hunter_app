import 'package:finance_hunter_app/features/cash_flow/presentation/widgets/categories_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType { categoriesList, categoriesHistoryList }

class CustomShimmer extends StatelessWidget {
  final ShimmerType type;

  const CustomShimmer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ShimmerType.categoriesList:
        return const _CategoriesListTileList();
      case ShimmerType.categoriesHistoryList:
        return const _CategoryHistoryShimmer();
    }
  }
}

class _CategoryHistoryShimmer extends StatelessWidget {
  const _CategoryHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesListTile(
          title: "Начало",
          isTotalAmount: true,
          amount: '',
        ),
        CategoriesListTile(
          title: "Конец",
          isTotalAmount: true,
          amount: '',
        ),
        CategoriesListTile(
          title: "Сумма",
          isTotalAmount: true,
          amount: "",
        ),
        Expanded(child: _CategoriesListTileList()),
      ],
    );
  }
}

class _CategoriesListTileList extends StatelessWidget {
  const _CategoriesListTileList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return _ShimmerCategoriesListTile();
      },
    );
  }
}

class _ShimmerCategoriesListTile extends StatelessWidget {
  const _ShimmerCategoriesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomShimmerBase(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: _ShimmerContainer(width: 32, height: 32),
        title: _ShimmerContainer(width: double.infinity, height: 14),
        subtitle: _ShimmerContainer(width: 100, height: 12),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ShimmerContainer(width: 60, height: 14),
            const SizedBox(height: 6),
            _ShimmerContainer(width: 40, height: 12),
          ],
        ),
      ),
    );
  }
}

class _CustomShimmerBase extends StatelessWidget {
  final Widget child;

  const _CustomShimmerBase({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}

class _ShimmerContainer extends StatelessWidget {
  final double height;
  final double? width;

  const _ShimmerContainer({required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
