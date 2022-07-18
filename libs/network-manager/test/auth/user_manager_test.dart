import 'package:core/ioc/di_container.dart';
import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/auth/user_manager.dart';

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  late MockSecureStorageService storageService;

  setUpAll(() {
    storageService = MockSecureStorageService();
    DIContainer.container.registerSingleton<StorageService>(
      (container) => storageService,
    );
  });

  tearDownAll(() {
    DIContainer.container.unregister<StorageService>();
  });
  test(
    'when we call  set user id'
    'it should save successfully',
    () async {
      final customerId = '10000000001';
      final userManager = UserManager(
        storageService,
      );
      when(
        () => storageService.set(
          any(),
          any(),
        ),
      ).thenAnswer((_) async {
        return null;
      });

      await userManager.setUserId(customerId);
      verify(() => storageService.set(any(), any())).called(1);
    },
  );

  test(
    'when we call  save wallet id'
    'it should save successfully',
    () async {
      final walletId = '12';
      final userManager = UserManager(
        storageService,
      );
      when(
        () => storageService.set(
          any(),
          any(),
        ),
      ).thenAnswer((_) async {
        return null;
      });

      await userManager.setWalletId(walletId);
      verify(() => storageService.set(any(), any())).called(1);
    },
  );

  test(
    'when we call get wallet id'
        'it should return wallet id',
        () async {
      final walletId = '12';
      final userManager = UserManager(
        storageService,
      );
      when(
            () => storageService.get(
          any(),
        ),
      ).thenAnswer((_) async {
        return walletId;
      });

      await userManager.getWalletId();
      verify(() => storageService.get(any())).called(1);
    },
  );

  test(
    'when we call get user id'
    'it should return user id',
    () async {
      final userId = '10000000001';
      final userManager = UserManager(
        storageService,
      );
      when(
        () => storageService.get(
          any(),
        ),
      ).thenAnswer((_) async {
        return userId;
      });

      await userManager.getUserId();
      verify(() => storageService.get(any())).called(1);
    },
  );
}
