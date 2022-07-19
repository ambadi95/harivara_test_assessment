
import 'package:core/analytics/default_tracker_collection.dart';
import 'package:core/analytics/tracker.dart';
import 'package:core/contacts/get_contacts.dart';

import 'package:core/environment/environment_resolver.dart';

import 'package:core/ioc/di_container.dart';

import 'package:core/native_document_directory/native_document_directory.dart';

import 'package:core/navigation/navigation_manager.dart';

import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/platform_retriever.dart';
import 'package:core/session_management/inactivity_service.dart';
import 'package:core/share_download/share_download_image.dart';
import 'package:core/share_download/share_file_manager.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:core/storage/storage_service.dart';
import 'package:core/translation/crayon_payment_transaltions_loader.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:core/validators/input_entry_validator/input_entry_validator.dart';

import 'package:network_manager/auth/auth_manager.dart';
import 'package:network_manager/auth/user_manager.dart';

import 'package:network_manager/utils/connectivity/i_connectivity.dart';
import 'package:task_manager/cache_manager/storage/file_storage/file_storage_service_impl.dart';
import 'package:task_manager/cache_manager/storage/memory_storage/memory_storage_service_impl.dart';
import 'package:task_manager/cache_manager/storage/crayon_payment_storage_service.dart';
import 'package:task_manager/cache_manager/storage/unsecure_storage/unsecure_storage_service_impl.dart';
import 'package:task_manager/session_management/inactivity_service_impl.dart';
import 'package:task_manager/task_manager.dart';
import 'package:welcome/navigation_handler/welcome_route_manager.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/app_mobile_widgets.dart';
import 'package:widget_library/error/network_error.dart';
import 'package:widget_library/keypad/utils/keypad_button_pressed_value_updater.dart';

class AppModule {


  // ignore: long-method
  static Future<void> registerDependencies() async {


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

    WelcomeModule.registerDependencies();

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



}

void _registerToolTipFeature() {
  final navigationManagerContainer = DIContainer.container<NavigationManager>();

}
