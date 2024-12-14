import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:pull_to_refresh_new/pull_to_refresh.dart';

class AppRefresher extends StatefulWidget {
  final Widget child;
  final VoidCallback onRefresh;
  final VoidCallback? onLoadMore;

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
    return SmartRefresher(
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      enablePullUp: widget.onLoadMore != null,
      physics: const BouncingScrollPhysics(),
      header: ClassicHeader(
        releaseText: AppLocalizations.releaseToRefresh,
        refreshingText: AppLocalizations.refreshing,
        idleText: AppLocalizations.pullToRefresh,
        completeText: AppLocalizations.refreshCompleted,
        failedText: AppLocalizations.refreshFailed,
        textStyle: AppFonts.mdRegular.copyWith(
          color: AppColors.grey,
        ),
        outerBuilder: (child) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: child,
          );
        },
        idleIcon: const Icon(
          Icons.arrow_downward_rounded,
          color: AppColors.grey,
          size: 16,
        ),
        releaseIcon: const Icon(
          Icons.arrow_upward_rounded,
          color: AppColors.grey,
          size: 16,
        ),
        completeIcon: const Icon(
          Icons.check_rounded,
          color: AppColors.grey,
          size: 16,
        ),
        failedIcon: const Icon(
          Icons.error_outline_outlined,
          color: AppColors.grey,
          size: 16,
        ),
        refreshingIcon: const CupertinoActivityIndicator(
          color: AppColors.grey,
          radius: 8,
        ),
      ),
      footer: ClassicFooter(
        canLoadingText: AppLocalizations.releaseToLoadMore,
        loadingText: AppLocalizations.loading,
        idleText: AppLocalizations.pullToLoadMore,
        failedText: AppLocalizations.loadFailed,
        loadStyle: LoadStyle.ShowWhenLoading,
        textStyle: AppFonts.mdRegular.copyWith(
          color: AppColors.grey,
        ),
        outerBuilder: (child) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: child,
          );
        },
        idleIcon: const Icon(
          Icons.arrow_upward_rounded,
          color: AppColors.grey,
          size: 16,
        ),
        canLoadingIcon: const Icon(
          Icons.arrow_downward_rounded,
          color: AppColors.grey,
          size: 16,
        ),
        failedIcon: const Icon(
          Icons.error_outline_outlined,
          color: AppColors.grey,
          size: 16,
        ),
        loadingIcon: const CupertinoActivityIndicator(
          color: AppColors.grey,
          radius: 8,
        ),
      ),
      child: widget.child,
    );
  }
}
