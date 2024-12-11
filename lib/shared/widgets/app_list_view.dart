import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';

class AppListView extends StatefulWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollController? controller;
  final AppPagedConfig? pagedConfig;
  final Future<void> Function()? onRefresh;
  final Future<void> Function(int? page, int limit)? onLoadMore;
  final Axis scrollDirection;
  final double? gap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final bool? primary;
  final bool? shrinkWrap;
  final Widget? loadMoreWidget;

  const AppListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.pagedConfig,
    this.onRefresh,
    this.onLoadMore,
    this.scrollDirection = Axis.vertical,
    this.gap,
    this.physics,
    this.padding,
    this.primary,
    this.shrinkWrap,
    this.loadMoreWidget,
  });

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  late int? page;
  late int? limit;

  @override
  void initState() {
    page = widget.pagedConfig?.page;
    limit = widget.pagedConfig?.limit;

    super.initState();
  }

  Future<void> onLoadMore() async {
    if (widget.onLoadMore == null) {
      page = null;
      return;
    }

    await Future(() => widget.onLoadMore?.call(page, limit ?? 1));
    setState(() {
      page = (widget.itemCount < (limit ?? 10)) ? null : (page ?? 1) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: 500.ms,
          curve: Curves.easeIn,
        )
      ],
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            onLoadMore();
          }
          return false;
        },
        child: ListView.separated(
          controller: widget.controller,
          scrollDirection: widget.scrollDirection,
          itemCount: widget.itemCount + (page != null ? 1 : 0),
          primary: widget.primary ?? false,
          shrinkWrap: widget.shrinkWrap ?? false,
          padding: widget.padding,
          physics: widget.physics ??
              const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
          separatorBuilder: (context, index) {
            return Visibility(
              visible: widget.scrollDirection == Axis.vertical,
              replacement: SizedBox(width: widget.gap ?? 12),
              child: SizedBox(height: widget.gap ?? 12),
            );
          },
          itemBuilder: (context, index) {
            if (index == widget.itemCount) {
              return Visibility(
                visible: widget.loadMoreWidget == null,
                replacement: widget.loadMoreWidget ?? const SizedBox(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          AppLocalizations.loading,
                          style: AppFonts.mdMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return widget.itemBuilder(context, index);
          },
        ),
      ),
    );
  }
}

class AppPagedConfig {
  final int? page;
  final int limit;

  AppPagedConfig({
    this.page = 1,
    this.limit = 10,
  });
}
