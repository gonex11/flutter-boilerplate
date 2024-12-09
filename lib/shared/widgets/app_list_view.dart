import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class AppListView extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollController? controller;
  final Axis? scrollDirection;
  final double? gap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final bool? primary;
  final bool? shrinkWrap;

  const AppListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.scrollDirection,
    this.gap,
    this.physics,
    this.padding,
    this.primary,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: 500.ms,
          curve: Curves.easeIn,
        )
      ],
      child: ListView.separated(
        controller: controller,
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount: itemCount,
        primary: primary ?? false,
        shrinkWrap: shrinkWrap ?? false,
        padding: padding,
        physics: physics ??
            const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
        separatorBuilder: (context, index) {
          return Gap(gap ?? 8);
        },
        itemBuilder: itemBuilder,
      ),
    );
  }
}
