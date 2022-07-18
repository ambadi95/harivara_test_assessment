import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/customer/create_customer_request.dart';

import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return Create Customer Object', () async {
      // Arrange
      final json = rawJsonToMap('customer/create_customer.json');
      // Act
      final result = CreateCustomerRequest.fromJson(json);
      // Assert
      expect(result, isA<CreateCustomerRequest>());
      expect(result.iqamaId, json['iqamaId']);
      expect(result.mobileNo, json['mobileNo']);
      expect(result.firstName, json['firstName']);
      expect(result.secondName, json['secondName']);
      expect(result.thirdName, json['thirdName']);
      expect(result.lastName, json['lastName']);
      expect(result.fatherName, json['fatherName']);
      expect(result.grandFatherName, json['grandFatherName']);
      expect(result.englishFirstName, json['englishFirstName']);
      expect(result.englishSecondName, json['englishSecondName']);
      expect(result.englishThirdName, json['englishThirdName']);
      expect(result.englishLastName, json['englishLastName']);
      expect(result.dateOfBirth, json['dateOfBirth']);
      expect(result.dateType, json['dateType']);
      expect(result.gender, json['gender']);
      expect(result.idExpiryDate, json['idExpiryDate']);
      expect(result.jobDesc, json['jobDesc']);
      expect(result.idIssuePlace, json['idIssuePlace']);
      expect(result.sponsorName, json['sponsorName']);
      expect(result.nationalityCode, json['nationalityCode']);
      expect(result.employmentStatus, json['employmentStatus']);
      expect(result.sourceOfIncome, json['sourceOfIncome']);
      expect(result.salaryRange, json['salaryRange']);
      expect(result.password, json['password']);
      expect(result.confirmPassword, json['confirmPassword']);
    });
  });
}
