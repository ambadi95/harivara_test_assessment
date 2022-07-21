import 'package:flutter_test/flutter_test.dart';
import 'package:shared_data_models/agent_nearby/agent_nearby_model.dart';
import '../raw_json_files/raw_json_reader.dart';

void main() {
  group('fromJson()', () {
    test('should return agent model Object', () async {
      // Arrange
      final json = rawJsonToMap('agent/merchant_model.json');
      // Act
      final result = AgentNearbyModel.fromJson(json);
      // Assert
      expect(result, isA<AgentNearbyModel>());
      expect(result.agentId, json['merchantId']);
      expect(result.mobileNo, json['mobileNo']);
      expect(result.address, json['email']);
      expect(result.imagePath, json['companyName']);
      expect(result.distance, json['registrationNo']);
    });
  });
}
