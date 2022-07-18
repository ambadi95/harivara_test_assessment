import 'package:flutter/material.dart';
import 'package:widget_library/page_header/avatar_row.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class _Sizes {
  static const double spacerHeight = 24;
  static const double compactSpacerHeight = 16;
}

class WelcomeUser extends StatelessWidget {
  final String userImageUri;
  final TextUIDataModel welcomeTitle;
  final TextUIDataModel welcomeSubtitle;

  const WelcomeUser({
    Key? key,
    required this.userImageUri,
    required this.welcomeTitle,
    required this.welcomeSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('WelcomeUser_Column'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          key: Key('WelcomeUser_SizedBox'),
          height: _Sizes.spacerHeight,
        ),
        AvatarRow(
          key: Key('WelcomeUser_AvatarRow'),
          userImageUri: userImageUri,
        ),
        SizedBox(
          key: Key('WelcomeUser_AfterAvatarSizedBox'),
          height: _Sizes.compactSpacerHeight,
        ),
        _WelcomeTitle(welcomeTitle),
        _WelcomeSubtitle(welcomeSubtitle),
        SizedBox(key: Key('WelcomeUser_AfterSubtitleSizedBox'), height: _Sizes.spacerHeight),
      ],
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  final TextUIDataModel title;

  _WelcomeTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return CrayonPaymentText(
      text: TextUIDataModel(
        title.text,
        styleVariant: CrayonPaymentTextStyleVariant.headline2,
      ),
    );
  }
}

class _WelcomeSubtitle extends StatelessWidget {
  final TextUIDataModel subtitle;

  _WelcomeSubtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    return CrayonPaymentText(
      text: TextUIDataModel(
        subtitle.text,
        styleVariant: CrayonPaymentTextStyleVariant.subtitle1,
      ),
    );
  }
}
