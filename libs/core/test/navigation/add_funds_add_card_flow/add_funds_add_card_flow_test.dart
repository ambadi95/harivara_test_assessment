import 'package:core/navigation/add_funds_add_card_flow/add_funds_add_card_flow.dart';
import 'package:core/navigation/add_funds_add_card_flow/add_funds_add_card_flow_navigation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_data_models/source_screen/source_screen.dart';
import 'package:shared_data_models/card_wallet/card_wallet.dart';

class MockAddFundsAddCardFlowNavigation extends Mock
    implements AddFundsAddCardFlowNavigation {}

class MockCardWallet extends Mock implements CardWallet {}

void main() {
  late AddCardAddFundsFlow addCardAddFundsFlow;
  late AddFundsAddCardFlowNavigation addCardFlowNavigation;
  final SourceScreen sourceScreen = SourceScreen.payment();
  late CardWallet cardWallet;

  setUp(() {
    cardWallet = MockCardWallet();
    addCardFlowNavigation = MockAddFundsAddCardFlowNavigation();
    addCardAddFundsFlow = AddCardAddFundsFlow(addCardFlowNavigation);

    when(() => addCardFlowNavigation.navigateToAddFunds(any(), sourceScreen))
        .thenAnswer((_) async => null);
  });

  group('startFlow', () {
    group('cards not available', () {
      final callback = () async => null;

      test(
          'if cards not available, should nav to add card flow and then not nav to add funds if no card is returned',
          () async {
        // Arrange
        when(() => addCardFlowNavigation.navigateAddCard(sourceScreen))
            .thenAnswer((_) async => null);
        // Act
        await addCardAddFundsFlow.startFlow(
          getCardsCallback: callback,
          screenToPopUntil: sourceScreen,
        );
        // Assert
        verify(() => addCardFlowNavigation.navigateAddCard(sourceScreen))
            .called(1);
        verifyNever(() =>
            addCardFlowNavigation.navigateToAddFunds(any(), sourceScreen));
      });

      test(
          'if cards not available, should nav to add card flow and then nav add funds if card is returned',
          () async {
        // Arrange
        when(() => addCardFlowNavigation.navigateAddCard(sourceScreen))
            .thenAnswer((_) async => cardWallet);
        // Act
        await addCardAddFundsFlow.startFlow(
          getCardsCallback: callback,
          screenToPopUntil: sourceScreen,
        );
        // Assert
        verify(() => addCardFlowNavigation.navigateAddCard(sourceScreen))
            .called(1);
        verify(() =>
                addCardFlowNavigation.navigateToAddFunds(any(), sourceScreen))
            .captured;
      });
    });

    group('cards available', () {
      final callback = () async => [cardWallet];
      /*
        TODO:
          - Test for override
       */
      test('should nav to add funds if no override passed', () async {
        // Arrange
        when(() => addCardFlowNavigation.navigateToAddFunds(
            [cardWallet], sourceScreen)).thenAnswer((_) async => null);
        // Act
        await addCardAddFundsFlow.startFlow(
          getCardsCallback: callback,
          screenToPopUntil: sourceScreen,
        );
        // Assert
        verify(() => addCardFlowNavigation
            .navigateToAddFunds([cardWallet], sourceScreen)).called(1);
      });

      test('should nav to add funds if no override passed', () async {
        // Arrange
        int count = 0;
        when(() => addCardFlowNavigation.navigateToAddFunds(
            [cardWallet], sourceScreen)).thenAnswer((_) async => null);
        // Act
        await addCardAddFundsFlow.startFlow(
          getCardsCallback: callback,
          screenToPopUntil: sourceScreen,
          overrideNavToAddFundsIfCardsAvailable: () async {
            count ++;
          },
        );
        // Assert
        verifyNever(() => addCardFlowNavigation
            .navigateToAddFunds([cardWallet], sourceScreen));
        expect(count, 1);
      });
    });
  });
}
