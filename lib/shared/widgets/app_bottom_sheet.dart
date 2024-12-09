import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      builder: (context, controller) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 16,
            bottom: context.mediaQueryViewInsets.bottom + 16,
          ),
          decoration: BoxDecoration(
            color: colorScheme.surfaceBright,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        );
      },
    );
  }
}
