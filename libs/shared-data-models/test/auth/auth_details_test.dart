import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/auth/auth_detail.dart';
import 'package:shared_data_models/auth/auth_type.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  setUp(() {});

  group('[AuthDetails] - fromJson()', () {
    test('should return a valid model', () async {
      // Arrange
      final json = rawJsonToMap('auth/auth_details.json');
      // Act
      final result = AuthDetail.fromJson(json);
      // Assert
      expect(result, isA<AuthDetail>());

    });
  });

  group('[AuthDetails] - copyWith()', () {
    test('should return new authValue', () async {
      // Arrange
      final json = rawJsonToMap('auth/auth_details.json');
      // Act
      var authDetails = AuthDetail.fromJson(json);
      // authDetails = authDetails.copyWith(authValue: 'new_auth_value');
      // // Assert
      // expect(authDetails.authValue, 'new_auth_value');
    });

    test('should keep old authDetails value', () async {
      // Arrange
      final json = rawJsonToMap('auth/auth_details.json');
      // Act
      var authDetails = AuthDetail.fromJson(json);
      // authDetails = authDetails.copyWith(authType: null);
      // // Assert
      // expect(authDetails.authType.toString(), json['authType']);
    });
  });

  group('[AuthDetails] - get props', () {
    test('should return new authValue', () async {
      final authType = AuthType.pin();
      final authValue = 'auth_value_for_test';
      List<Object?> authDetailsProps = [authType, authValue];
      // Arrange
      // final authDetails = AuthDetail(authType, authValue);
      // // Act
      // var props = authDetails.props;
      // // Assert
      // for (int i = 0; i < props.length; i++) {
      //   expect(props.elementAt(i), authDetailsProps.elementAt(i));
      // }
    });
  });
}
