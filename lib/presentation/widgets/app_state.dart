import 'package:flutter/material.dart';

class AppState extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const AppState({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverFillRemaining(child: child),
        ],
      ),
    );
  }
}
