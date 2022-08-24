import 'dart:io';

import 'package:core/app/crayon_payment_material_app.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/session_management/inactivity_watcher.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';
import 'package:core/translation/crayon_payment_translations.dart';
import 'package:device_option/view/device_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/src/framework.dart';
import 'package:get/get.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:payments/view/payments_screen.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';
import 'package:splash/splash/view/splash.dart';
import 'package:welcome/sub_features/enrollment_success/view/enrollment_success_screen.dart';
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

  HomeWidget(this._translations,
      this._navigationManager,
      this._inactivityService,
      this._status,);


  @override
  Widget build(BuildContext context) {
    return InactivityWatcher(
      inactivityService: _inactivityService,
      child: CrayonPaymentMaterialApp(
        key: Key('AppMaterialApp'),
        home: !_status ?
        PaymentsScreen(paymentsScreenArgs: PaymentsScreenArgs('assets/images/mobile_0.png','PP_Daily_Repayment_Title','20,000 TZSHS'))
            : CrayonHomeScreen.forCustomerApp(),

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
