import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_new/pull_to_refresh.dart';

class AppRefresher extends StatefulWidget {
  final Widget child;
  final Function() onRefresh;
  final Function()? onLoadMore;

  const AppRefresher({
    super.key,
    required this.child,
    required this.onRefresh,
    this.onLoadMore,
  });

  @override
  State<AppRefresher> createState() => _AppRefresherState();
}

class _AppRefresherState extends State<AppRefresher> {
  late final RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onRefresh() async {
    await Future(() => widget.onRefresh()).then((_) {
      controller.refreshCompleted();
    });
  }

  void onLoadMore() async {
    await Future(() => widget.onLoadMore?.call()).then((_) {
      controller.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return SmartRefresher(
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      enablePullUp: widget.onLoadMore != null,
      physics: const BouncingScrollPhysics(),
      header: ClassicHeader(
        refreshStyle: RefreshStyle.Follow,
        releaseText: AppLocalizations.releaseToRefresh(),
        refreshingText: AppLocalizations.refreshing(),
        idleText: AppLocalizations.pullToRefresh(),
        completeText: AppLocalizations.refreshCompleted(),
        failedText: AppLocalizations.refreshFailed(),
        textStyle: AppFonts.mdRegular.copyWith(
          color: colorScheme.onSurface,
        ),
        outerBuilder: (child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: child,
          );
        },
        idleIcon: Icon(
          Icons.arrow_downward_rounded,
          color: colorScheme.onSurface,
          size: 16,
        ),
        releaseIcon: Icon(
          Icons.arrow_upward_rounded,
          color: colorScheme.onSurface,
          size: 16,
        ),
        completeIcon: Icon(
          Icons.check_rounded,
          color: colorScheme.onSurface,
          size: 16,
        ),
        failedIcon: Icon(
          Icons.error_outline_outlined,
          color: colorScheme.onSurface,
          size: 16,
        ),
        refreshingIcon: CupertinoActivityIndicator(
          color: colorScheme.onSurface,
          radius: 8,
        ),
      ),
      footer: ClassicFooter(
        canLoadingText: AppLocalizations.releaseToLoadMore(),
        loadingText: AppLocalizations.loading(),
        idleText: AppLocalizations.pullToLoadMore(),
        failedText: AppLocalizations.loadFailed(),
        loadStyle: LoadStyle.ShowWhenLoading,
        textStyle: AppFonts.mdRegular.copyWith(
          color: colorScheme.onSurface,
        ),
        outerBuilder: (child) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 12,
            ),
            child: child,
          );
        },
        idleIcon: Icon(
          Icons.arrow_upward_rounded,
          color: colorScheme.onSurface,
          size: 16,
        ),
        canLoadingIcon: Icon(
          Icons.arrow_downward_rounded,
          color: colorScheme.onSurface,
          size: 16,
        ),
        failedIcon: Icon(
          Icons.error_outline_outlined,
          color: colorScheme.onSurface,
          size: 16,
        ),
        loadingIcon: CupertinoActivityIndicator(
          color: colorScheme.onSurface,
          radius: 8,
        ),
      ),
      child: widget.child,
    );
  }
}
