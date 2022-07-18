import '../request.dart';

class StandardRequest extends Request {
  // uri parameters that are added to the requests url.
  Map<String, String>? uriParameters;
  bool? showBusy;
  // json body of the request
  String? jsonBody;
}
