import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final bool center;
  final bool scrolled;
  final double? initialHeight;
  final double? maxHeight;
  final double? minHeight;

  const AppBottomSheet({
    super.key,
    required this.children,
    this.center = false,
    this.scrolled = true,
    this.initialHeight,
    this.maxHeight,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      snap: true,
      expand: scrolled,
      snapSizes: [initialHeight ?? .5, 1],
      initialChildSize: initialHeight ?? .5,
      maxChildSize: maxHeight ?? 1,
      minChildSize: minHeight ?? .25,
      snapAnimationDuration: const Duration(milliseconds: 300),
      builder: (context, controller) {
        return Container(
          width: double.infinity,
          height: context.mediaQuerySize.height,
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
          child: SingleChildScrollView(
            controller: controller,
            physics: (scrolled)
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: (center)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
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
                ...children,
              ],
            ),
          ),
        );
      },
    );
  }
}
