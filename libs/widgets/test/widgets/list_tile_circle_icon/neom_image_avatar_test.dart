import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/list_tile_circle_icon/crayon_payment_image_avatar.dart';

void main() {
  late Widget testWidget;

  setUp(() async {
    ByteData bytes = await rootBundle
        .load('packages/widget_library/assets/images/CrayonPayment_logo.png');

    testWidget = MaterialApp(
      home: Scaffold(
        body: CrayonPaymentImageAvatar(
          avatarImage: MemoryImage(
            bytes.buffer.asUint8List(),
          ),
        ),
      ),
    );
  });

  testWidgets('finds the widget', (tester) async {
    // Arrange
    final containerFinder = find.byKey(Key('circle_image'));
    // Act
    await tester.pumpWidget(testWidget);
    // Assert
    expect(containerFinder, findsOneWidget);
  });
}
