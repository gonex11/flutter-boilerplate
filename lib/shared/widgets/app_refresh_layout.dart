import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRefreshLayout extends StatelessWidget {
  final Future Function() onRefresh;
  final Widget child;

  const AppRefreshLayout({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return RefreshIndicator.adaptive(
      backgroundColor: colorScheme.primary,
      color: colorScheme.onPrimary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
