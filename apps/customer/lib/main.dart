import 'dart:io';
import 'package:core/app/crayon_payment_material_app.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/session_management/inactivity_watcher.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';
import 'package:core/translation/crayon_payment_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/src/framework.dart';
import 'package:get/get.dart';
import 'package:welcome/sub_features/welcome/view/welcome_screen.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'app_module.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await AppModule.registerDependencies();
  final translations = CrayonPaymentTranslations(
    DIContainer.container.resolve<CrayonPaymentTranslationsLoader>(),
  );
  await translations.loadTranslationFiles();
  await CrayonPaymentTheme().initialize(loadCustomTheme: true);

  bool status = false;

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    ProviderScope(
      key: Key('ProviderScope'),
      child: HomeWidget(
        translations,
        DIContainer.container<NavigationManager>(),
        DIContainer.container<IInactivityService>(),
        status,
      ),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  final Translations _translations;
  final NavigationManager _navigationManager;
  final IInactivityService _inactivityService;
  final bool _status;

  HomeWidget(
      this._translations,
      this._navigationManager,
      this._inactivityService,
      this._status,
      );

  @override
  Widget build(BuildContext context) {
    return InactivityWatcher(
      inactivityService: _inactivityService,
      child: CrayonPaymentMaterialApp(
        key: Key('AppMaterialApp'),
        home: !_status
            ? CrayonWelcomScreen.forCustomerApp()
            : CrayonWelcomScreen.forCustomerApp(),
        theme: CrayonPaymentTheme().defaultTheme,
        onGenerateRoute: _navigationManager.getRoute,
        translations: _translations,
        locale: Get.deviceLocale,
        builder: (context, child) {
          return child ?? Container();
        },
      ),
    );
  }
}




class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
