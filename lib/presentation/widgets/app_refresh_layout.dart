import 'package:flutter/material.dart';

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
    return RefreshIndicator.adaptive(
      backgroundColor: Colors.white,
      color: Colors.blue,
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
