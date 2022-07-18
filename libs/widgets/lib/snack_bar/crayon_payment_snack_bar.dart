import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';
import 'package:widget_library/utils/icon_utils.dart';

class CrayonPaymentSnackbarWidget extends StatefulWidget {
  static const String _identifier = 'CrayonPaymentSnackbarWidget';
  final VoidCallback _onDismiss;
  final String _title;
  final String _iconPath;
  final String _subtitle;
  final bool _barrierDismissable;
  final Duration? _autoDismissDuration;
  final EdgeInsets _margins;
  final Color _backgroundColor;
  final Color _titleColor;
  final Color _subtitleColor;

  CrayonPaymentSnackbarWidget._(
    this._title,
    this._subtitle,
    this._iconPath,
    this._barrierDismissable,
    this._autoDismissDuration,
    this._margins,
    this._backgroundColor,
    this._titleColor,
    this._subtitleColor,
    this._onDismiss, {
    Key? key,
  }) : super(key: key);

  static CrayonPaymentSnackbarBuilder of(BuildContext context) {
    return CrayonPaymentSnackbarBuilder(context: context);
  }

  @override
  _CrayonPaymentSnackbarWidgetState createState() => _CrayonPaymentSnackbarWidgetState();
}

class _CrayonPaymentSnackbarWidgetState extends State<CrayonPaymentSnackbarWidget>
    with SingleTickerProviderStateMixin {
  bool _dismissing = false;
  final int _enterAnimationDuration = 250;
  final int _exitAnimationDuration = 150;
  final int _swipeSensitivity = 8;
  late Timer _dismissTimer;
  double _opacity = 0;
  double _topPosition = 0;
  int _animationDuration = 0;
  double _contentHeight = 0;

  final GlobalKey _content = GlobalKey();
  Curve _animationCurve = Curves.easeOutCubic;

  @override
  void initState() {
    super.initState();
    if (widget._autoDismissDuration == null) {
      _dismissTimer = Timer(_dismissTime(), () {
        _dismiss();
      });
    } else {
      _dismissTimer = Timer(widget._autoDismissDuration!, () {
        _dismiss();
      });
    }
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      RenderBox box = _content.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        _opacity = 1.0;
        _animationDuration = 0;
        _contentHeight = box.size.height;
        _topPosition = -_contentHeight;
        Future.delayed(Duration(milliseconds: 10)).then((value) {
          setState(() {
            _animationDuration = _enterAnimationDuration;
            _topPosition = CrayonPaymentDimensions.defaultMargin;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (widget._barrierDismissable) {
          _dismiss();
        }
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < -_swipeSensitivity) {
          _dismiss();
        }
      },
      child: Container(
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: _animationCurve,
              duration: Duration(milliseconds: _animationDuration),
              top: _topPosition,
              left: 0,
              right: 0,
              child: Material(
                type: MaterialType.transparency,
                child: Opacity(
                  opacity: _opacity,
                  child: GestureDetector(
                    onTap: () {
                      _dismissTimer.cancel();
                      _dismiss();
                    },
                    child: Container(
                      margin: widget._margins,
                      padding: EdgeInsetsDirectional.only(
                        start: CrayonPaymentDimensions.inlineFieldsMargin,
                        bottom: CrayonPaymentDimensions.inlineFieldsMargin,
                        top: CrayonPaymentDimensions.inlineFieldsMargin,
                      ),
                      decoration: BoxDecoration(
                        color: widget._backgroundColor,
                        borderRadius: BorderRadius.circular(
                          CrayonPaymentDimensions.inlineFieldsMargin,
                        ),
                      ),
                      key: _content,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _icon,
                              Text(
                                widget._title,
                                key: Key(
                                  '${CrayonPaymentSnackbarWidget._identifier}title',
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: widget._titleColor,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30 + CrayonPaymentDimensions.inlineFieldsMargin,
                              ),
                              Expanded(
                                child: Text(
                                  widget._subtitle,
                                  key: Key(
                                    '${CrayonPaymentSnackbarWidget._identifier}subtitle',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: widget._subtitleColor,
                                        height: 1.5,
                                        fontSize: 14,
                                      ),
                                ),
                              )

                              // _textContent(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Duration _dismissTime() {
    int textLength = widget._title.length + widget._subtitle.length;
    if (Get.locale?.languageCode == 'en') {
      return Duration(
        milliseconds: max(
          textLength * 150,
          3000,
        ),
      );
    } else {
      return Duration(
        milliseconds: max(
          textLength * 250,
          3000,
        ),
      );
    }
  }

  Widget get _icon => Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        margin: EdgeInsetsDirectional.only(
          end: CrayonPaymentDimensions.inlineFieldsMargin,
        ),
        child: getSvg(widget._iconPath),
      );

  void _dismiss() {
    if (_dismissing) {
      return;
    }
    _dismissing = true;
    setState(() {
      _animationCurve = Curves.easeInCubic;
      _animationDuration = _exitAnimationDuration;
      _topPosition = -_contentHeight;

      Future.delayed(Duration(milliseconds: _animationDuration))
          .then((value) => widget._onDismiss());
    });
  }
}

class CrayonPaymentSnackbarBuilder {
  final BuildContext context;
  late OverlayEntry _entry;

  CrayonPaymentSnackbarBuilder({
    required this.context,
  });

  void show(
    String title,
    String subtitle, {
    String? icon,
    bool? barrierDismissable,
    VoidCallback? onDismiss,
    Duration? autoDismissDuration,
    EdgeInsets? margins,
    Color? backgroundColor,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    CrayonPaymentSnackbarWidget widget = CrayonPaymentSnackbarWidget._(
        title,
        subtitle,
        icon ?? CrayonPaymentIconPath.snackbarIconInfo,
        barrierDismissable ?? false,
        autoDismissDuration,
        margins ?? EdgeInsets.all(24),
        backgroundColor ?? CrayonPaymentColors.crayonPaymentSnackbarBackgroundColor,
        titleColor ?? Colors.white,
        subtitleColor ?? CrayonPaymentColors.crayonPaymentSnackbarSubtitleColor, () {
      _entry.remove();
      if (onDismiss != null) {
        onDismiss();
      }
    });
    _entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          top: 0,
          child: widget,
        );
      },
    );
    Overlay.of(context)?.insert(_entry);
  }
}
