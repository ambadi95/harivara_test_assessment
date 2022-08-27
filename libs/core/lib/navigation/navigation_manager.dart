import 'dart:async';
import 'package:core/logging/logger.dart';
import 'package:core/navigation/i_route_manager.dart';
import 'package:core/navigation/modal_bottom_sheet.dart';
import 'package:core/navigation/navigation_arguments.dart';
import 'package:core/navigation/navigation_details.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

abstract class NavigationManager {
  void registerRouteManager(
    String featureName,
    IRouteManager routeManager,
  );

  Route getRoute(RouteSettings settings);

  Future<dynamic> navigateWithNavDetails(
    NavigationDetails navDetails,
  );

  // ignore: long-parameter-list
  Future<dynamic> navigateTo(
    String routeName,
    NavigationType navigationType, {
    dynamic arguments,
    bool barrierDismissiable = true,
    bool preventDuplicates = true,
    ModalBottomSheet? modalBottomSheet,
  });

  void goBack({arguments});

  void popDialog({arguments});

  String get getCurrentRouteName;

  bool get isBottomSheetOpen;

  String get getPreviousRouteName;
}

class NavigationManagerImpl extends NavigationManager {
  final Map<String, IRouteManager> _routeManagers = <String, IRouteManager>{};

  @override
  void registerRouteManager(
    String featureName,
    IRouteManager routeManager,
  ) {
    _routeManagers[featureName] = routeManager;
  }

  @override
  Route getRoute(RouteSettings settings) {
    // TODO since we can hit this via a deep-link, we need to check that the user is logged in
    // and redirect to src and then to the deep-link. *Danger, Will Robinson!*.
    final uri = Uri.parse(settings.name!);
    final featureName = _returnModuleName(uri.path);
    final navigationArguments = NavigationArguments.getNavigationArguments(
      settings,
    );
    final routeSettings = RouteSettings(
      name: uri.path,
      arguments: navigationArguments.newScreenArguments ?? uri.queryParameters,
    );
    final view = _routeManagers[featureName]!.getView(routeSettings);
    return GetPageRoute(
      page: () => view,
      fullscreenDialog: navigationArguments.presentAsModal,
      settings: routeSettings,
    );
  }

  String _returnModuleName(String path) => path.split('/')[0];

  @override
  Future<dynamic> navigateWithNavDetails(
    NavigationDetails navDetails,
  ) async {
    return await navigateTo(
      navDetails.pushPath,
      navDetails.pushType,
      arguments: navDetails,
    );
  }

  /// Navigates to a view/src based on the Navigation type
  /// Push, Fullscreen Dialog, Remove stack and Push, Dialog, Bottomsheet are supported
  // ignore: long-parameter-list
  @override
  Future<dynamic> navigateTo(
    String routeName,
    NavigationType navigationType, {
    dynamic arguments,
    bool barrierDismissiable = true,
    bool preventDuplicates = true,
    ModalBottomSheet? modalBottomSheet,
  }) async {
    var future = navigationType.when(
      push: () => _push(
        routeName,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      ),
      fullScreenDialog: () => _push(
        routeName,
        arguments: arguments,
        presentAsModal: true,
      ),
      replace: () => _replaceTo(
        routeName,
        arguments: arguments,
      ),
      replaceCurrent: () => _replaceCurrent(
        routeName,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      ),
      dialog: () => _showDialogNamed(
        routeName,
        arguments: arguments,
        barrierDismissiable: barrierDismissiable,
      ),
      tooltip: () => _showTooltipNamed(
        routeName,
        arguments: arguments,
        isDismissible: barrierDismissiable,
      ),
      bottomSheet: () => _showBottomSheetNamed(
        routeName,
        arguments: arguments,
        isDismissible: barrierDismissiable,
        modalBottomSheet: modalBottomSheet,
      ),
      popUntil: () {
        _popUntil(
          routeName,
        );
        return null;
      },
    );
    return await future;
  }

  void _popUntil(String routeName) {
    Get.until((route) => route.settings.name == routeName);
  }

  Future<dynamic> _push(
    String routeName, {
    dynamic arguments,
    bool presentAsModal = false,
    bool preventDuplicates = true,
  }) {
    return Get.toNamed(
          routeName,
          preventDuplicates: preventDuplicates,
          arguments: NavigationArguments(presentAsModal, arguments),
        ) ??
        Future.value();
  }

  Future<dynamic> _replaceTo(String routeName, {dynamic arguments}) {
    final names = routeName.split('/');

    // We need to pop _past_ the named route, so use this to track it.
    var replaceNow = false;

    return Get.offNamedUntil(
          routeName,
          (route) {
            final prevReplaceNow = replaceNow;
            replaceNow = names[1] == route.settings.name;
            return prevReplaceNow;
          },
          arguments: NavigationArguments(
            false,
            arguments,
          ),
        ) ??
        Future.value();
  }

  Future<dynamic> _replaceCurrent(String routeName,
      {dynamic arguments, bool preventDuplicates = true}) {
    return Get.offNamed(
          routeName,
          preventDuplicates: preventDuplicates,
          arguments: NavigationArguments(
            false,
            arguments,
          ),
        ) ??
        Future.value();
  }

  @override
  void goBack({arguments}) {
    Get.back(result: arguments);
  }

  @override
  void popDialog({arguments}) {
    goBack(arguments: arguments);
  }

  @override
  String get getCurrentRouteName => Get.currentRoute;

  @override
  bool get isBottomSheetOpen => Get.isBottomSheetOpen ?? false;

  @override
  String get getPreviousRouteName => Get.previousRoute;

  Future _showDialogNamed(
    String dialogPath, {
    dynamic arguments,
    bool barrierDismissiable = true,
  }) {
    final featureName = _returnModuleName(dialogPath);
    final dialogWidget =
        _routeManagers[featureName]?.getDialog(dialogPath, arguments);

    return Get.dialog(
      dialogWidget ?? Container(),
      barrierDismissible: barrierDismissiable,
    );
  }

  Future _showTooltipNamed(
    String tooltipPath, {
    dynamic arguments,
    bool isDismissible = true,
  }) {
    final featureName = _returnModuleName(tooltipPath);
    final tooltipWidget =
        _routeManagers[featureName]?.getTooltip(tooltipPath, arguments);

    return Get.dialog(
      tooltipWidget ?? Container(),
      barrierDismissible: isDismissible,
    );
  }

  Future _showBottomSheetNamed(
    String bottomSheetPath, {
    dynamic arguments,
    bool isDismissible = true,
    ModalBottomSheet? modalBottomSheet,
  }) {
    final featureName = _returnModuleName(bottomSheetPath);
    CrayonPaymentLogger.logInfo(_routeManagers.toString());
    final dialogWidget =
        _routeManagers[featureName]!.getBottomSheet(bottomSheetPath, arguments);

    if (arguments != null &&
        arguments is Map<String, dynamic> &&
        arguments.isNotEmpty) {
      return Get.bottomSheet(
        dialogWidget,
        isScrollControlled: arguments['isScrollControlled'] as bool? ?? false,
        backgroundColor: arguments['backgroundColor'] as Color? ?? Colors.white,
        isDismissible: arguments['isDismissible'] as bool? ?? isDismissible,
        shape: arguments['shape'] as ShapeBorder?,
      );
    }

    if (modalBottomSheet != null) {
      return _showModalBottomSheet(
        dialogWidget,
        modalBottomSheet,
      );
    }
    return Get.bottomSheet(
      dialogWidget,
      isScrollControlled: false,
      isDismissible: isDismissible,
    );
  }

  Future<Widget?> _showModalBottomSheet(
    Widget dialogWidget,
    ModalBottomSheet modalBottomSheet,
  ) {
    return showModalBottomSheet<Widget?>(
      useRootNavigator: modalBottomSheet.useRootNavigator,
      barrierColor: Colors.black.withOpacity(0.5),
      isScrollControlled: modalBottomSheet.isScrollControlled,
      backgroundColor: modalBottomSheet.backgroundColor,
      isDismissible: modalBottomSheet.isDismissible,
      context: modalBottomSheet.context,
      builder: (BuildContext context) {
        return modalBottomSheet.height != null
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height *
                      modalBottomSheet.height!,
                ),
                child: dialogWidget,
              )
            : dialogWidget;
      },
    );
  }
}
