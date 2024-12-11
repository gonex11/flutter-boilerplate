import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';
import 'package:flutter_boilerplate/shared/utils/app_localizations.dart';
import 'package:get/get.dart';

const double _kDragContainerExtentPercentage = 0.25;
const double _kDragSizeFactorLimit = 1.5;
const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);
const Duration _kIndicatorScaleDuration = Duration(milliseconds: 200);

typedef RefreshCallback = Future<void> Function();

enum _AppRefreshIndicatorMode {
  drag,
  armed,
  snap,
  refresh,
  done,
  canceled,
}

class AppRefreshIndicator extends StatefulWidget {
  final Widget child;
  final double displacement;
  final double edgeOffset;
  final RefreshCallback onRefresh;
  final Color? backgroundColor;
  final ScrollNotificationPredicate notificationPredicate;
  final String? semanticsLabel;
  final String? semanticsValue;
  final RefreshIndicatorTriggerMode triggerMode;

  const AppRefreshIndicator({
    super.key,
    required this.child,
    this.displacement = 16.0,
    this.edgeOffset = 6.0,
    required this.onRefresh,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  });

  @override
  AppRefreshIndicatorState createState() => AppRefreshIndicatorState();
}

class AppRefreshIndicatorState extends State<AppRefreshIndicator>
    with TickerProviderStateMixin<AppRefreshIndicator> {
  late AnimationController _positionController;
  late AnimationController _scaleController;
  late Animation<double> _positionFactor;
  late Animation<double> _scaleFactor;
  late Animation<Color?> _valueColor;

  _AppRefreshIndicatorMode? _mode;
  late Future<void> _pendingRefreshFuture;
  bool? _isIndicatorAtTop;
  double? _dragOffset;
  late Color _effectiveValueColor = context.theme.colorScheme.primary;

  static final Animatable<double> _kDragSizeFactorLimitTween =
      Tween<double>(begin: 0.0, end: _kDragSizeFactorLimit);
  static final Animatable<double> _oneToZeroTween =
      Tween<double>(begin: 1.0, end: 0.0);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
  }

  @override
  void didChangeDependencies() {
    _setupColorTween();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AppRefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setupColorTween();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _setupColorTween() {
    _effectiveValueColor = context.theme.colorScheme.primary;
    final Color color = _effectiveValueColor;
    if (color.alpha == 0x00) {
      _valueColor = AlwaysStoppedAnimation<Color>(color);
    } else {
      _valueColor = _positionController.drive(
        ColorTween(
          begin: color.withAlpha(0),
          end: color.withAlpha(color.alpha),
        ).chain(
          CurveTween(
            curve: const Interval(0.0, 1.0 / _kDragSizeFactorLimit),
          ),
        ),
      );
    }
  }

  bool _shouldStart(ScrollNotification notification) {
    return ((notification is ScrollStartNotification &&
                notification.dragDetails != null) ||
            (notification is ScrollUpdateNotification &&
                notification.dragDetails != null &&
                widget.triggerMode == RefreshIndicatorTriggerMode.anywhere)) &&
        ((notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter == 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore == 0.0)) &&
        _mode == null &&
        _start(notification.metrics.axisDirection);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    if (_shouldStart(notification)) {
      setState(() {
        _mode = _AppRefreshIndicatorMode.drag;
      });
      return false;
    }
    final bool? indicatorAtTopNow =
        switch (notification.metrics.axisDirection) {
      AxisDirection.down || AxisDirection.up => true,
      AxisDirection.left || AxisDirection.right => null,
    };
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_mode == _AppRefreshIndicatorMode.drag ||
          _mode == _AppRefreshIndicatorMode.armed) {
        _dismiss(_AppRefreshIndicatorMode.canceled);
      }
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == _AppRefreshIndicatorMode.drag ||
          _mode == _AppRefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.scrollDelta!;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.scrollDelta!;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
      if (_mode == _AppRefreshIndicatorMode.armed &&
          notification.dragDetails == null) {
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == _AppRefreshIndicatorMode.drag ||
          _mode == _AppRefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.overscroll;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.overscroll;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_mode) {
        case _AppRefreshIndicatorMode.armed:
          if (_positionController.value < 1.0) {
            _dismiss(_AppRefreshIndicatorMode.canceled);
          } else {
            _show();
          }
        case _AppRefreshIndicatorMode.drag:
          _dismiss(_AppRefreshIndicatorMode.canceled);
        case _AppRefreshIndicatorMode.canceled:
        case _AppRefreshIndicatorMode.done:
        case _AppRefreshIndicatorMode.refresh:
        case _AppRefreshIndicatorMode.snap:
        case null:
          break;
      }
    }
    return false;
  }

  bool _handleIndicatorNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) {
      return false;
    }
    if (_mode == _AppRefreshIndicatorMode.drag) {
      notification.disallowIndicator();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_mode == null);
    assert(_isIndicatorAtTop == null);
    assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
      case AxisDirection.up:
        _isIndicatorAtTop = true;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == _AppRefreshIndicatorMode.drag ||
        _mode == _AppRefreshIndicatorMode.armed);
    double newValue =
        _dragOffset! / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == _AppRefreshIndicatorMode.armed) {
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    }
    _positionController.value = clampDouble(newValue, 0.0, 1.0);
    if (_mode == _AppRefreshIndicatorMode.drag &&
        _valueColor.value!.alpha == _effectiveValueColor.alpha) {
      _mode = _AppRefreshIndicatorMode.armed;
    }
  }

  Future<void> _dismiss(_AppRefreshIndicatorMode newMode) async {
    await Future<void>.value();
    assert(newMode == _AppRefreshIndicatorMode.canceled ||
        newMode == _AppRefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode!) {
      case _AppRefreshIndicatorMode.done:
        await _scaleController.animateTo(1.0,
            duration: _kIndicatorScaleDuration);
      case _AppRefreshIndicatorMode.canceled:
        await _positionController.animateTo(0.0,
            duration: _kIndicatorScaleDuration);
      case _AppRefreshIndicatorMode.armed:
      case _AppRefreshIndicatorMode.drag:
      case _AppRefreshIndicatorMode.refresh:
      case _AppRefreshIndicatorMode.snap:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      _dragOffset = null;
      _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }

  void _show() {
    assert(_mode != _AppRefreshIndicatorMode.refresh);
    assert(_mode != _AppRefreshIndicatorMode.snap);
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _mode = _AppRefreshIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
            duration: _kIndicatorSnapDuration)
        .then<void>((void value) {
      if (mounted && _mode == _AppRefreshIndicatorMode.snap) {
        setState(() {
          _mode = _AppRefreshIndicatorMode.refresh;
        });

        final Future<void> refreshResult = widget.onRefresh();
        refreshResult.whenComplete(() {
          if (mounted && _mode == _AppRefreshIndicatorMode.refresh) {
            completer.complete();
            _dismiss(_AppRefreshIndicatorMode.done);
          }
        });
      }
    });
  }

  Future<void> show({bool atTop = true}) {
    if (_mode != _AppRefreshIndicatorMode.refresh &&
        _mode != _AppRefreshIndicatorMode.snap) {
      if (_mode == null) {
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      }
      _show();
    }
    return _pendingRefreshFuture;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleIndicatorNotification,
        child: widget.child,
      ),
    );
    assert(() {
      if (_mode == null) {
        assert(_dragOffset == null);
        assert(_isIndicatorAtTop == null);
      } else {
        assert(_dragOffset != null);
        assert(_isIndicatorAtTop != null);
      }
      return true;
    }());

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: (_mode == _AppRefreshIndicatorMode.refresh)
                ? widget.displacement * 3
                : 0,
          ),
          child: child,
        ),
        if (_mode != null)
          Positioned(
            top: _isIndicatorAtTop! ? widget.edgeOffset : null,
            bottom: !_isIndicatorAtTop! ? widget.edgeOffset : null,
            left: 0.0,
            right: 0.0,
            child: SizeTransition(
              axisAlignment: _isIndicatorAtTop! ? 1.0 : -1.0,
              sizeFactor: _positionFactor,
              child: Container(
                padding: _isIndicatorAtTop!
                    ? EdgeInsets.only(top: widget.displacement)
                    : EdgeInsets.only(bottom: widget.displacement),
                alignment: _isIndicatorAtTop!
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: ScaleTransition(
                  scale: _scaleFactor,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget? child) {
                      final typeToIcon = {
                        _AppRefreshIndicatorMode.refresh: Icons.sync_rounded,
                        _AppRefreshIndicatorMode.snap: Icons.sync_rounded,
                        _AppRefreshIndicatorMode.armed: Icons.sync_rounded,
                        _AppRefreshIndicatorMode.drag:
                            Icons.arrow_downward_rounded,
                      };

                      final typeToTitle = {
                        _AppRefreshIndicatorMode.refresh:
                            AppLocalizations.refreshing,
                        _AppRefreshIndicatorMode.snap:
                            AppLocalizations.refreshing,
                        _AppRefreshIndicatorMode.armed:
                            AppLocalizations.releaseToRefresh,
                        _AppRefreshIndicatorMode.drag:
                            AppLocalizations.pullToRefresh,
                      };

                      final icon = typeToIcon[_mode];
                      final title = typeToTitle[_mode];

                      return Visibility(
                        visible: icon != null && title != null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icon,
                              size: 16,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              title ?? '',
                              style: AppFonts.mdMedium,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
