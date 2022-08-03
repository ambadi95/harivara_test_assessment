
import 'package:agent_nearby/agent_nearby_module.dart';
import 'package:agent_nearby/navigation_handler/agent_nearby_route_manager.dart';
import 'package:core/analytics/default_tracker_collection.dart';
import 'package:core/analytics/tracker.dart';
import 'package:core/contacts/get_contacts.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/native_document_directory/native_document_directory.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/share_download/share_download_image.dart';
import 'package:core/share_download/share_file_manager.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/navigation/crayon_payment_bottom_sheet_navigation_handler.dart';
import 'package:core/sheets/navigation/crayon_payment_bottom_sheet_route_manager.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:core/storage/storage_service.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:core/validators/input_entry_validator/input_entry_validator.dart';
import 'package:device_option/device_option_module.dart';
import 'package:device_option/navigation_handler/device_option_route_manager.dart';
import 'package:home/home/home_module.dart';
import 'package:home/home/navigation_handler/home_route_manager.dart';
import 'package:login/login_module.dart';
import 'package:login/navigation_handler/login_route_manager.dart';
import 'package:passcode/navigation_handler/passcode_route_manager.dart';
import 'package:passcode/passcode_module.dart';
import 'package:settings/navigation_handler/settings_route_manager.dart';
import 'package:splash/splash_module.dart';
import 'package:task_manager/cache_manager/storage/file_storage/file_storage_service_impl.dart';
import 'package:task_manager/cache_manager/storage/memory_storage/memory_storage_service_impl.dart';
import 'package:task_manager/cache_manager/storage/crayon_payment_storage_service.dart';
import 'package:task_manager/cache_manager/storage/unsecure_storage/unsecure_storage_service_impl.dart';
import 'package:task_manager/session_management/inactivity_service_impl.dart';
import 'package:task_manager/task_manager.dart';
import 'package:termscondition/termscondition/navigation_handler/termscond_route_manager.dart';
import 'package:termscondition/termscondition/termscondition_module.dart';
import 'package:verifyotp/navigation_handler/verifyotp_route_manager.dart';
import 'package:verifyotp/verifyotp_module.dart';
import 'package:welcome/navigation_handler/welcome_route_manager.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/app_mobile_widgets.dart';
import 'package:widget_library/keypad/utils/keypad_button_pressed_value_updater.dart';
import 'package:settings/settings_model.dart';


class AppModule {


  // ignore: long-method
  static Future<void> registerDependencies() async {
    DefaultTrackerCollection collection = DefaultTrackerCollection();

    DIContainer.container.registerSingleton<TrackerCollection>((container) {
      return collection;
    });

    DIContainer.container.registerSingleton<StorageService>(
      (container) => SecureStorageService(),
    );
    DIContainer.container.registerSingleton<UnsecureStorageServiceImpl>(
      (container) => UnsecureStorageServiceImpl(),
    );
    DIContainer.container.registerSingleton(
      (container) => TaskManager(),
    );
    DIContainer.container.registerSingleton<IStorageService>(
      (container) => CrayonPaymentStorageService(
        container.resolve<TaskManager>(),
      ),
    );



    DIContainer.container.registerSingleton(
      (container) => CacheTaskResolver(
        secureStorageService: DIContainer.container<StorageService>(),
        fileStorageService: FileStorageServiceImpl(),
        unsecureStorageService: UnsecureStorageServiceImpl(),
        memoryStorageService: MemoryStorageServiceImpl(),
      ),
    );
    DIContainer.container.registerSingleton<NavigationManager>(
      (container) => NavigationManagerImpl(),
    );
    DIContainer.container.registerSingleton<WidgetsModule>(
      (container) => WidgetsModuleImpl(container.resolve<NavigationManager>()),
    );
    _registerRouteManagers();
    _registerUtils();

    SplashModule.registerDependencies();
    WelcomeModule.registerDependencies();
    PasscodeModule.registerDependencies();
    VerifyOtpModule.registerDependencies();

    AgentNearByModule.registerDependencies();

    DeviceOptionModule.registerDependencies();

    LoginModule.registerDependencies();

    HomeModule.registerDependencies();

    SettingsModule.registerDependencies();

    TermsConditionModule.registerDependencies();




    DIContainer.container.resolve<WidgetsModule>().registerDependencies();


    DIContainer.container.registerSingleton<IInactivityService>(
          (container) => InactivityService(
        taskManager: container.resolve<TaskManager>(),
        navigationManager: container.resolve<NavigationManager>(),
      ),
    );




  }
}

// ignore: long-method
void _registerUtils() {
  DIContainer.container.registerSingleton<AppInfoRetriever>(
    (container) => AppInfoRetrieverImpl.customerApp(),
  );

  DIContainer.container.registerSingleton<CrayonPaymentTranslationsLoader>(
        (container) => CrayonPaymentTranslationsLoaderImpl(),
  );

  DIContainer.container.registerSingleton<GetContacts>(
    (container) => GetContactsImpl(),
  );

  DIContainer.container.registerSingleton<InputEntryValidator>(
    (container) => InputEntryValidatorImpl.forCustomerApp(),
  );



  DIContainer.container.registerSingleton<LengthTextFormatter>(
    (container) => LengthTextFormatterImpl.forCustomerApp(),
  );

  DIContainer.container.registerSingleton<KeyPadButtonPressedValueUpdater>(
    (container) => KeyPadButtonPressedValueUpdaterImpl(),
  );

}

// ignore: long-method
void _registerRouteManagers() {
  final navigationManagerContainer = DIContainer.container<NavigationManager>();

  navigationManagerContainer.registerRouteManager(
    WelcomeModule.moduleIdentifier,
    WelcomeRouteManager(),
  );

  navigationManagerContainer.registerRouteManager(
    AgentNearByModule.moduleIdentifier,
    AgentNearByRouteManager(),
  );

  navigationManagerContainer.registerRouteManager(
    DeviceOptionModule.moduleIdentifier,
    DeviceOptionRouteManager(),
  );


  navigationManagerContainer.registerRouteManager(
    LoginModule.moduleIdentifier,
    LoginRouteManager(),
  );

  navigationManagerContainer.registerRouteManager(
    HomeModule.moduleIdentifier,
    HomeRouteManager(),
  );


  navigationManagerContainer.registerRouteManager(
    PasscodeModule.moduleIdentifier,
    PasscodeRouteManager(),
  );


  navigationManagerContainer.registerRouteManager(
    VerifyOtpModule.moduleIdentifier,
    VerifyOtpRouteManager(),
  );

  navigationManagerContainer.registerRouteManager(
    SettingsModule.moduleIdentifier,
    SettingsRouteManager(),
  );

  navigationManagerContainer.registerRouteManager(
    TermsConditionModule.moduleIdentifier,
    TermsConditionRouteManager(),
  );



  DIContainer.container.registerSingleton<NativeDocumentDirectory>(
    (container) => NativeDocumentDirectoryImpl(),
  );

  DIContainer.container.registerSingleton<ShareDownloadManger>(
    (container) => ShareDownloadMangerImpl(
      container.resolve<NativeDocumentDirectory>(),
      ShareFileManagerImpl(),
    ),
  );


  _registerBottomSheetFeature();
  _registerToolTipFeature();
}

void _registerBottomSheetFeature() {
  final navigationManagerContainer = DIContainer.container<NavigationManager>();
  navigationManagerContainer.registerRouteManager(
    CrayonPaymentBottomSheetRouteManager.moduleIdentifier,
    CrayonPaymentBottomSheetRouteManager(),
  );
  DIContainer.container.registerFactory<CrayonPaymentBottomSheetCoordinator>(
        (container) => CrayonPaymentBottomSheetCoordinator(
      CrayonPaymentBottomSheetNavigationHandler(
        container.resolve<NavigationManager>(),
      ),
    ),
  );


}

void _registerToolTipFeature() {
  final navigationManagerContainer = DIContainer.container<NavigationManager>();

}
