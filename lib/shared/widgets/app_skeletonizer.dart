import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppSkeletonizer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final bool? ignoreContainers;
  final Color? containersColor;
  final Color? baseColor;

  const AppSkeletonizer({
    super.key,
    required this.child,
    required this.enabled,
    this.ignoreContainers,
    this.containersColor,
    this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Skeletonizer(
      containersColor: containersColor,
      ignoreContainers: ignoreContainers,
      enableSwitchAnimation: true,
      effect: PulseEffect(
        from: theme.disabledColor,
        to: theme.dividerColor,
        duration: const Duration(seconds: 1),
      ),
      enabled: enabled,
      child: Animate(
        effects: [
          FadeEffect(
            duration: 500.ms,
            curve: Curves.easeIn,
          )
        ],
        child: child,
      ),
    );
  }
}
