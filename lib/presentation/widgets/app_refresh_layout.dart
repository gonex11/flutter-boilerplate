import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRefreshLayout extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const AppRefreshLayout({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return RefreshIndicator.adaptive(
      backgroundColor: colorScheme.surfaceBright,
      color: colorScheme.primary,
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverFillRemaining(
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}
