import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crayon_payment_app_bar_button_type.freezed.dart';

const _goBackCallBack = _goBackNavigation;

@freezed
class CrayonPaymentAppBarButtonType with _$CrayonPaymentAppBarButtonType {
  const CrayonPaymentAppBarButtonType._();

  static final String _identifier = 'CrayonPaymentAppBarButtons';

  const factory CrayonPaymentAppBarButtonType.back({
    @Default(_goBackCallBack) void Function()? onPressed,
  }) = CrayonPaymentBackButton;

  const factory CrayonPaymentAppBarButtonType.menu({
    void Function()? onPressed,
  }) = CrayonPaymentMenuButton;

  const factory CrayonPaymentAppBarButtonType.search({
    void Function()? onPressed,
  }) = CrayonPaymentSearchButton;

  const factory CrayonPaymentAppBarButtonType.close({
    @Default(_goBackCallBack) void Function()? onPressed,
  }) = CrayonPaymentCloseButton;

  const factory CrayonPaymentAppBarButtonType.share({
    void Function()? onPressed,
  }) = CrayonPaymentShareButton;

  const factory CrayonPaymentAppBarButtonType.more({
    void Function()? onPressed,
  }) = CrayonPaymentMoreButton;

  const factory CrayonPaymentAppBarButtonType.skip({
    void Function()? onPressed,
  }) = CrayonPaymentSkipButton;

  const factory CrayonPaymentAppBarButtonType.login({
    void Function()? onPressed,
  }) = CrayonPaymentLoginButton;

  const factory CrayonPaymentAppBarButtonType.signup({
    void Function()? onPressed,
  }) = CrayonPaymentSignupButton;

  get onPressed => null;

  Widget getButton(
    BuildContext context,
    Color color,
  ) {
    return when(
      back: (_) => _getIconButton(
        '${_identifier}_BackArrow',
        Icons.arrow_back,
        color,
      ),
      close: (_) => _getIconButton(
        '${_identifier}_CloseIcon',
        Icons.close,
        color,
      ),
      menu: (_) => _getIconButton(
        '${_identifier}_MenuIcon',
        Icons.menu,
        color,
      ),
      more: (_) => _getIconButton(
        '${_identifier}_MoreIcon',
        Icons.more_horiz_sharp,
        color,
      ),
      search: (_) => _getIconButton(
        '${_identifier}_SearchIcon',
        Icons.search,
        color,
      ),
      share: (_) => _getIconButton(
        '${_identifier}_ShareIcon',
        Icons.ios_share,
        color,
      ),
      skip: (_) => _getTextButton(
        '${_identifier}_SkipButton',
        'Skip',
        context,
      ),
      login: (_) => _getTextButton(
        '${_identifier}_LoginButton',
        'Log in',
        context,
      ),
      signup: (_) => _getTextButton(
        '${_identifier}_SignUpButton',
        'Sign up',
        context,
      ),
    );
  }

  Widget _getIconButton(
    String keyString,
    IconData iconData,
    Color? color,
  ) {
    return Icon(
      iconData,
      key: Key(keyString),
      color: color,
    );
  }

  Widget _getTextButton(
    String keyString,
    String text,
    BuildContext context,
  ) {
    return Center(
      child: Text(
        text,
        // ignore: deprecated_member_use
        style: Theme.of(context).appBarTheme.textTheme?.bodyText1,
        key: Key(keyString),
      ),
    );
  }
}

void _goBackNavigation() {
  DIContainer.container.resolve<NavigationManager>().goBack();
}
