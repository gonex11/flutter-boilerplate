import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:pull_to_refresh_new/pull_to_refresh.dart';

class AppRefreshIndicator extends StatefulWidget {
  final VoidCallback onRefresh;
  final Widget child;

  const AppRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  State<AppRefreshIndicator> createState() => _AppRefreshIndicatorState();
}

class _AppRefreshIndicatorState extends State<AppRefreshIndicator> {
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
      setState(() {
        controller.refreshCompleted();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      onRefresh: onRefresh,
      header: ClassicHeader(
        releaseText: AppLocalizations.releaseToRefresh,
        refreshingText: AppLocalizations.refreshing,
        idleText: AppLocalizations.pullToRefresh,
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
      child: widget.child,
    );
  }
}
