import 'package:flutter_test/flutter_test.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';

void main() {
  late SearchBarAttributes model;

  setUp(() {
    model = SearchBarAttributes();
  });

  test('[Search bar model]- copyWith updates the value', () async {
    // Arrange
    model = model.copyWith(
      dataModel: SearchBarDataModel(),
      appearance: SearchBarAppearance(),
    );
    // Assert
    expect(model.dataModel, isA<SearchBarDataModel>());
  });
}
