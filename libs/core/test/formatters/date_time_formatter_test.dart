import 'package:core/formatters/date_time_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  late DateTimeFormatter formatter;
  setUp(() {
    formatter = DateTimeFormatter();
  });

  group('[DateTimeFormatter] - formatDashYMD', () {
    test('should format date with dash [1]', () async {
      // Arrange
      final value = DateTime.utc(2002, 3, 24);

      // Act
      final result = formatter.formatDashYMD(value);

      // Assert
      expect(result, '2002-03-24');
    });

    test('should format date with dash [2]', () async {
      // Arrange
      final value = DateTime.parse('2012-02-27 13:27:00,123456789z');

      // Act
      final result = formatter.formatDashYMD(value);

      // Assert
      expect(result, '2012-02-27');
    });

    test('should format date with dash [3]', () async {
      // Arrange
      final value = DateTime.parse('20120227 13:27:00');

      // Act
      final result = formatter.formatDashYMD(value);

      // Assert
      expect(result, '2012-02-27');
    });
  });

  group('[DateTimeFormatter] - parseGraphQlDateTime()', () {
    setUp(() {
      initializeDateFormatting('en');
    });

    test('should parse correct DateTime in PM', () async {
      // Arrange
      const dateTimeString = '1/14/2021 5:45:06 PM';
      // Act
      final result = formatter.parseGraphQlDateTime(dateTimeString);
      // Assert
      expect(result, isA<DateTime>());
      expect(result.day, 14);
      expect(result.month, 1);
      expect(result.year, 2021);
      expect(result.hour, 17);
      expect(result.minute, 45);
      expect(result.second, 06);
    });

    test('should parse correct DateTime in AM', () async {
      // Arrange
      const dateTimeString = '1/08/2019 6:45:06 AM';
      // Act
      final result = formatter.parseGraphQlDateTime(dateTimeString);
      // Assert
      expect(result, isA<DateTime>());
      expect(result.day, 08);
      expect(result.month, 1);
      expect(result.year, 2019);
      expect(result.hour, 6);
      expect(result.minute, 45);
      expect(result.second, 06);
    });
  });
}
