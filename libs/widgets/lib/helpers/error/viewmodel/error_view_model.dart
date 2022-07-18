import 'package:flutter/material.dart';
import 'package:core/translation/i_app_localization_service.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:task_manager/task_manager_impl.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:widget_library/buttons/docked_button_bar.dart';
import 'package:widget_library/helpers/error/data_model/error_data_model.dart';
import 'package:widget_library/helpers/error/helper/error_helper.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/page_header_text_under_icon/page_header_text_under_icon_widget_attributes.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/success_screen/success_screen_widget_attributes.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:widget_library/utils/icon_utils.dart';

class ErrorViewModel extends BaseViewModel<SuccessScreenBaseWidgetAttributes?> {
  final IAppLocalizationService _localization;

  ErrorViewModel(this._localization, TaskManager taskManager) : super(null);

  void initialize(Map<String, dynamic>? args) {
    if (args != null) {
      final errorNode = ErrorNode.fromJson(args);
      final onNext = args['onNext'] as Function(ErrorButtonType type)?;
      state = createAttribute(errorNode, onNext, 'generic_error');
    }
  }

  SuccessScreenBaseWidgetAttributes createAttribute(
    ErrorNode errorNode,
    Function(ErrorButtonType type)? onNext,
    String theme,
  ) {
    return SuccessScreenBaseWidgetAttributes(
      padding: CrayonPaymentPadding(left: 16, right: 16, top: 80),
      bottomBarAttributes: _buildBottomBar(errorNode.buttons, onNext),
      bottomDecoration: getBottomDecorationAttributes(theme),
      additionalButtonAttributes:
          _getAdditionalButtonAttributes(theme, errorNode, onNext),
      items: CrayonPaymentPageHeaderTextUnderIconWidgetAttributes(
        headerTopPadding: 0,
        headerBottomPadding: 0,
        leftMargin: 16,
        rightMargin: 16,
        attributesList: _buildAttributesList(errorNode, theme),
      ),
      message: _buildMessage(errorNode.message),
      theme: theme,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  List<CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes> _buildAttributesList(
    ErrorNode errorNode,
    String theme,
  ) {
    var attributes = [_buildIcon(errorNode, theme)];

    final header = _buildHeader(theme, errorNode.title);
    if (header != null) {
      attributes.add(header);
    }

    final subHeader = _buildSubHeader(theme, errorNode.subTitle);
    if (subHeader != null) {
      attributes.add(subHeader);
    }

    return attributes;
  }

  CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes _buildIcon(
    ErrorNode errorNode,
    String theme,
  ) {
    return CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes(
      icon: errorNode.icon != null
          ? errorNode.icon!
          : 'app_mobile_login:assets/images/ic_error.svg',
      padding: CrayonPaymentPadding(width: 123, height: 123),
      format: CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat.horizontal,
    );
  }

  CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes? _buildHeader(
    String theme,
    String? title,
  ) {
    if (!(title.isNullOrEmpty())) {
      return CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes(
        title: TextUIDataModel(
          _localization.getValue(title!),
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline1,
        ),
        padding: CrayonPaymentPadding(top: 42),
        format: CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat.horizontal,
      );
    }
    return null;
  }

  CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes? _buildSubHeader(
    String theme,
    String? title,
  ) {
    if (!(title.isNullOrEmpty())) {
      return CrayonPaymentPageHeaderTextUnderIconWidgetElementAttributes(
        title: TextUIDataModel(
          _localization.getValue(title!),
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline2,
        ),
        padding: CrayonPaymentPadding(top: 8),
        format: CrayonPaymentPageHeaderTextUnderIconWidgetElementFormat.horizontal,
      );
    }
    return null;
  }

  TextUIDataModel? _buildMessage(String? title) {
    if (!(title.isNullOrEmpty())) {
      return TextUIDataModel(
        _localization.getValue(title!),
        textAlign: TextAlign.center,
        styleVariant: CrayonPaymentTextStyleVariant.normal,
      );
    }
    return null;
  }

  BottomDecorationAttributes? getBottomDecorationAttributes(String theme) {
    final color = CrayonPaymentTheme().themeData.colorPalette!.primary.toColor();
    return BottomDecorationAttributes(
      image: 'app_mobile_login:assets/images/ic_error_bg.png',
      type: ImageType.Png,
      startColor: color,
      endColor: color.withOpacity(0.85),
    );
  }

  CrayonPaymentDockedButtonBarAttributes? _buildBottomBar(
    List<ErrorNodeButton>? buttons,
    Function(ErrorButtonType type)? onNext,
  ) {
    if (buttons != null) {
      final buttonsList = buttons
          .where((e) => e.type == ErrorButtonType.SWIPE_UP_TO_CLOSE)
          .map((ErrorNodeButton button) {
        var title = _localization.getValue('card:yourCard_swipe_to_close');
        if (button.title != null) {
          title = button.title!;
        }
        return CrayonPaymentDockedButtonBarElementDetails(
          text: _localization.getValue(title),
          type: CrayonPaymentDockedButtonBarElementType.swipeButton,
          buttonTextStyleVariant: CrayonPaymentTextStyleVariant.bodyText2,
          onPressed: () {
            onNext?.call(button.type);
          },
        );
      }).toList();
      return CrayonPaymentDockedButtonBarAttributes(buttonsList);
    }
    return null;
  }

  List<AdditionalButtonAttributes>? _getAdditionalButtonAttributes(
    String theme,
    ErrorNode errorNode,
    Function(ErrorButtonType type)? onNext,
  ) {
    var buttons = errorNode.buttons;
    if (buttons != null) {
      var list = buttons
          .where((e) => e.type != ErrorButtonType.SWIPE_UP_TO_CLOSE)
          .map((ErrorNodeButton button) {
        var title = button.title;
        if (title == null) {
          switch (button.type) {
            case ErrorButtonType.CONTACT_SUPPORT:
              title = _localization.getValue('card:yourCard_contact_support');
              break;
            case ErrorButtonType.TRY_AGAIN:
              title = _localization.getValue('card:yourCard_try_again');
              break;
            default:
          }
        }
        return AdditionalButtonAttributes(
          text: TextUIDataModel(
            _localization.getValue(title!),
          ),
          position: 'aboveBottomBar',
          onPressed: () {
            onNext?.call(button.type);
          },
        );
      }).toList();
      if (list.isNotEmpty) {
        return list;
      }
    }
    return null;
  }
}
