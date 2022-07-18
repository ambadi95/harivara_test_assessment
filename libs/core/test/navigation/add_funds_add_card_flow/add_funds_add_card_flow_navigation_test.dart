import 'package:core/navigation/add_funds_add_card_flow/add_funds_add_card_flow_navigation.dart';
import 'package:core/navigation/navigation_details.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_data_models/source_screen/source_screen.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Mock implements Route<dynamic> {}

class MockCardWallet extends Mock implements CardWallet {}

class MockNavigationManager extends Mock implements NavigationManager {}

class MockNavigationType extends Mock implements NavigationType {}

class MockNavigationDetails extends Mock implements NavigationDetails {}

void main() {
  late Widget testWidget;
  late NavigatorObserver mockObserver;
  late AddFundsAddCardFlowNavigation navigationHandler;
  late NavigationManager navigationManager;

  final SourceScreen sourceScreen = SourceScreen.customerHome();

  setUpAll(() {
    registerFallbackValue(MockNavigationType());
    registerFallbackValue(MockCardWallet());
    registerFallbackValue(MockNavigationDetails());
  });

  setUp(() {
    navigationManager = MockNavigationManager();
    navigationHandler = AddFundsAddCardFlowNavigation(navigationManager);
    mockObserver = MockNavigatorObserver();
    Get.testMode = true;

    registerFallbackValue(MockRoute());

    when(
      () => navigationManager.navigateWithNavDetails(
        any(),
      ),
    ).thenAnswer((_) async => null);

    when(
      () => navigationManager.navigateTo(
        any(),
        any(),
        arguments: any(named: 'arguments'),
      ),
    ).thenAnswer((_) async => null);

    testWidget = ProviderScope(
      child: MaterialApp(
        navigatorObservers: [mockObserver],
        home: Scaffold(body: Container()),
      ),
    );
  });

  testWidgets('[AddFundsAddCardFlowNavigation] - navigateAddCard',
      (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    await navigationHandler.navigateAddCard(sourceScreen);
    // Assert
    verify(
      () => navigationManager.navigateWithNavDetails(
        any(),
      ),
    ).called(1);
  });

  testWidgets('[AddFundsAddCardFlowNavigation] - navigateToAddFunds',
      (tester) async {
    // Act
    await tester.pumpWidget(testWidget);
    await navigationHandler
        .navigateToAddFunds([MockCardWallet()], sourceScreen);
    // Assert
    verify(
      () => navigationManager.navigateTo(
        any(),
        any(),
        arguments: any(named: 'arguments'),
      ),
    ).called(1);
  });
}
