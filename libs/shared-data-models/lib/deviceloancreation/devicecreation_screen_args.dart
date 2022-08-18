import 'package:config/Config.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
class DeviceLoanCreationArgs {
  final Data deviceDetailData;
  final String image;


  DeviceLoanCreationArgs(
      this.deviceDetailData,
      this.image,

      );
}
