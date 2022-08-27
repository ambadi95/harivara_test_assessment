import 'package:core/storage/secure_storage/secure_storage_service.dart';
import 'package:network_manager/auth/auth_manager.dart';

import '../request.dart';

class StandardRequest extends Request {
  // uri parameters that are added to the requests url.
  Map<String, String>? uriParameters;
  bool? showBusy;
  // json body of the request
  String? jsonBody;



  Future<Map<String, String>>  headers() async{
    Map<String, String> hashMap= Map();
   var jwtToken = 'Bearer ${await SecureStorageService().get('jwt-token')}';
    hashMap.putIfAbsent('Authorization', ()   =>  jwtToken);
    hashMap.putIfAbsent('Content-Type',() => 'application/json');
    return hashMap;
  }


}
