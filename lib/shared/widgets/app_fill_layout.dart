import 'package:flutter/material.dart';

class AppFillLayout extends StatelessWidget {
  final Widget child;

  const AppFillLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverFillViewport(
          delegate: SliverChildListDelegate(
            [Center(child: child)],
          ),
        ),
      ],
    );
  }
}
