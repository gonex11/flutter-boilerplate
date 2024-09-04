import 'package:flutter/material.dart';
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
    return Skeletonizer(
      containersColor: containersColor,
      ignoreContainers: ignoreContainers,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor:
            (baseColor != null) ? baseColor! : Colors.grey.withOpacity(.3),
        highlightColor: Colors.grey.withOpacity(.2),
        duration: const Duration(seconds: 1),
      ),
      enabled: enabled,
      child: child,
    );
  }
}
