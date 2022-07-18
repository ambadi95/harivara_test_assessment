import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/add_funds/add_funds_screen_args.dart';

void main() {
  setUp(() {});

  group('[AddFundsScreenArgs] - fromJson()', () {
    test('should return a valid model', () async {
      // Arrange
      final screenArgs = AddFundsScreenArgs(usersCards: []);
      // Assert
      expect(screenArgs.usersCards.length, 0);
      expect(screenArgs.sourceScreen, isNull);
      expect(screenArgs.initialAmount, isNull);
    });
  });
}
