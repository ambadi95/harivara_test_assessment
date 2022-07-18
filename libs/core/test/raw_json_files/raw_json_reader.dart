import 'dart:convert';
import 'dart:io';

Map<String, dynamic> rawJsonToMap(String nameOfFile) {
  final file = File('test/raw_json_files/$nameOfFile');
  final String jsonAsString = file.readAsStringSync();
  return json.decode(jsonAsString) as Map<String, dynamic>;
}

Map<String, String> rawJsonToMapStringsOnly(String nameOfFile) {
  final file = File('test/raw_json_files/$nameOfFile');
  final String jsonAsString = file.readAsStringSync();
  final jsonMap = json.decode(jsonAsString) as Map<String, dynamic>;
  return Map<String, String>.from(jsonMap);
}
