
import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';


class DetailsApiResolver extends TaskResolver {
  final IDetailsService _detailsService;

  DetailsApiResolver(this._detailsService);

  @override
  Future execute(String identifier, Map<String, dynamic> requestData) {
    switch (identifier) {
      case IDetailsService.regionIdentifier:
        return _detailsService.getRegion();
      case IDetailsService.districtIdentifier:
        return _detailsService.getDistrict(
          requestData['regionId']
        );
      default:
        throw UnimplementedError();
    }
  }
}
