import 'dart:convert';

import 'package:core/ioc/di_container.dart';
import 'package:core/logging/logger.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:widget_library/helpers/error/data_model/error_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:widget_library/info_bubble/info_bubble_widget.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

enum ErrorButtonType {
  @JsonValue('SWIPE_UP_TO_CLOSE')
  SWIPE_UP_TO_CLOSE,
  @JsonValue('TRY_AGAIN')
  TRY_AGAIN,
  @JsonValue('CONTACT_SUPPORT')
  CONTACT_SUPPORT,
}

class _Constants {
  static final String defaultPackageName = 'default';
  static final String defaultService = 'default';
  static final String defaultErrorCode = 'default';
}

class ErrorDataManager {
  static Map<String, ErrorData> errorData = {};

  static Future<ErrorNode> getErrorDetails({
    required String? package,
    required String? service,
    required String? errorCode,
  }) async {
    if (!(errorData.containsKey(package))) {
      // The package data is not yet read, so read it first
      // Read the text styles from the assets directory
      await _readPackagErrorJSON(package);
    }

    return _readErrorNode(
      errorCode: errorCode ?? _Constants.defaultErrorCode,
      package: package ?? _Constants.defaultPackageName,
      service: service ?? _Constants.defaultService,
    );
  }

  static Future<ErrorNode> _readErrorNode({
    required String package,
    required String service,
    required String errorCode,
  }) async {
    final packageErrorData = errorData[package];
    final serviceErrorList = packageErrorData!.errorList.firstWhere(
      (element) => element.service.toLowerCase().compareTo(service) == 0,
    );
    //generic error messages are moved to the app level...
    final defaultErrorNode = await getDefaultErrorNode(errorCode);

    final errorNode = serviceErrorList.items.firstWhere(
      (element) => element.code.toLowerCase().compareTo(errorCode) == 0,
      orElse: () => defaultErrorNode,
    );

    return errorNode;
  }

  static Future<ErrorNode> getDefaultErrorNode(String errorCode) async {
    if (!(errorData.containsKey(_Constants.defaultPackageName))) {
      await _readPackagErrorJSON(null);
    }
    final packageErrorData = errorData[_Constants.defaultPackageName];
    final serviceErrorList = packageErrorData!.errorList.firstWhere(
      (element) =>
          element.service.toLowerCase().compareTo(_Constants.defaultService) ==
          0,
    );

    final defaultErrorNode = serviceErrorList.items.firstWhere(
      (element) => element.code.toLowerCase().compareTo('default') == 0,
    );

    return serviceErrorList.items.firstWhere(
      (element) => element.code.toLowerCase().compareTo(errorCode) == 0,
      orElse: () => defaultErrorNode,
    );
  }

  static Future<void> _readPackagErrorJSON(String? packageName) async {
    final errorDataObject = await _readErrorJson(packageName);
    final currentPackageName = packageName ?? _Constants.defaultPackageName;
    errorData[currentPackageName] = errorDataObject;
  }

  static Future<ErrorData> _readErrorJson(String? packageName) async {
    var path = '';
    if (!(packageName.isNullOrEmpty())) {
      path = path + 'packages/' + '$packageName' + '/';
    }

    path = path + 'assets/error/error.json';
    final jsonString = await rootBundle.loadString(path);
    final result = json.decode(jsonString) as Map<String, dynamic>;

    return ErrorData.fromJson(result);
  }
}

const _defaultOverlayErrorTheme = 'overlay_error_screen';

///Zero means, user will have to manually close the window
///by clicking on the close button
const _defaultOverlayErrorDuration = Duration(seconds: 3);

mixin ErrorHandler {
  Future<dynamic> showError({
    String? package,
    String? service,
    String? errorCode,
    String? message,
    Function(ErrorButtonType type)? onNext,
    String themeOverlayScreen = _defaultOverlayErrorTheme,
    Duration overlayScreenDuration = _defaultOverlayErrorDuration,
  }) async {
    final errorNode = await ErrorDataManager.getErrorDetails(
      package: package,
      service: service,
      errorCode: errorCode,
    );
    if (errorNode.type.toLowerCase().compareTo('full_screen') == 0) {
      final args = errorNode.toJson();
      if (message != null) {
        args['message'] = message;
      }
      args['onNext'] = onNext;
      // TODO: refactor below
      return DIContainer.container.resolve<NavigationManager>().navigateTo(
            'src/errorview',
            NavigationType.push(),
            arguments: args,
          );
    } else if (errorNode.type.toLowerCase().compareTo('overlay_screen') == 0) {
      showOverlayNotification(
        (context) {
          return Theme(
            data: CrayonPaymentTheme().themeFor(themeOverlayScreen),
            child: InfoBubbleWidgetOverlayWrapper(
              message: message ?? errorNode.message,
              title: errorNode.title,
              iconLeftPath: errorNode.icon,
            ),
          );
        },
        duration: overlayScreenDuration,
      );
      return;
    } else if (errorNode.type.toLowerCase().compareTo('api') == 0) {
      CrayonPaymentLogger.logDebug(
        'ApiError\n******************\nErrorCode: ${errorNode.code}\nErrorMessage: ${message ?? errorNode.message}\n******************\n',
      );
    }

    throw UnimplementedError('Error Type not handled');
  }

  //TODO...
  Future<dynamic> contactSupport() async {}
}
