import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:config/Config.dart';
import 'package:core/app/crayon_payment_material_app.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/logging/logger.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/session_management/inactivity_watcher.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';
import 'package:core/translation/crayon_payment_translations.dart';
import 'package:downpayment/view/down_payment_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/src/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:home/home/view/home_screen.dart';
import 'package:kyc/subfeatures/kycmain/view/kyc_credit_main_screen.dart';
import 'package:splash/splash/view/splash.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'app_module.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:shared_data_models/kyc/kyc_data_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await AppModule.registerDependencies();
  final translations = CrayonPaymentTranslations(
    DIContainer.container.resolve<CrayonPaymentTranslationsLoader>(),
  );
  var locale = Locale('sw');
  Get.updateLocale(locale);
  await translations.loadTranslationFiles();

  await CrayonPaymentTheme().initialize(loadCustomTheme: true);
  bool status = false;

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp();


  if (!kDebugMode) {

    runZonedGuarded(()  {
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
    },(error, stack) {
      if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      CrayonPaymentLogger.logError('$error\n$stack');
    },);
  }else {
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

  await _setupCrashlytics();


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
            ? CrayonHomeScreen(
          homeScreenArgs: HomeScreenArgs(userType: UserType.Agent,isAgent: true),
        )
            : CrayonSplashScreen.forMerchantApp(),
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

Future<void> _setupCrashlytics() async {
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
        );
      }).sendPort,
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
