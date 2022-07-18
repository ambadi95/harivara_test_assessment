import 'dart:convert';
import 'dart:io';

Map<String, dynamic> rawJsonToMap(String nameOfFile) {
  final file = File('test/raw_json_files/$nameOfFile');
  final String jsonAsString = file.readAsStringSync();
  return json.decode(jsonAsString) as Map<String, dynamic>;
}
