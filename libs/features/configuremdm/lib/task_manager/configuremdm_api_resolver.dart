import 'package:task_manager/task_manager.dart';


class ConfigureMdmApiResolver extends TaskResolver {
  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    // TODO: implement execute
    throw UnimplementedError();
  }
  // final IScanQRCodeService _scanQRCodeService;
  //
  // ScanQrCodeApiResolver(this._scanQRCodeService);
  //
  // @override
  // Future execute(String identifier, Map<String, dynamic> requestData) {
  //   switch (identifier) {
  //
  //     case IScanQRCodeService.deviceRegisterIdentifier:
  //       return _scanQRCodeService.deviceRegister(requestData);
  //
  //     default:
  //       throw UnimplementedError();
  //   }
  // }
}

