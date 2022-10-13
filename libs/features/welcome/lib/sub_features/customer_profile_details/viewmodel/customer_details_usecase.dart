import 'package:config/Config.dart';
import 'package:core/logging/logger.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:shared_data_models/customer_onboard/customer_details/request/customer_details_request.dart';
import 'package:shared_data_models/customer_onboard/customer_details/response/customer_detail_response.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/district_response.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/region_details.dart';
import 'package:shared_data_models/organisation_type_list_response/organisation_type_list_response.dart';
import 'package:task_manager/base_classes/base_data_provider.dart';
import 'package:task_manager/task_manager.dart';
import 'package:welcome/sub_features/customer_profile_details/service/customer_details_service.dart';

import 'package:welcome/sub_features/customer_profile_details/viewmodel/customer_details_view_model.dart';
import 'package:welcome/sub_features/details/service/details_service.dart';

import '../../../data_model/region.dart';
import '../../../welcome_module.dart';

class CustomerDetailsUseCase extends BaseDataProvider {
  final CustomerDetailsViewModel detailsViewModel;

  CustomerDetailsUseCase(this.detailsViewModel, TaskManager taskManager)
      : super(taskManager);

  bool isValidName(String name) {
    return detailsViewModel.isValidName(name);
  }

  bool isValidEmail(String emailId) {
    return detailsViewModel.isValidEmailId(emailId);
  }

  bool isValidPoBox(String poBox) {
    return detailsViewModel.isValidPoBox(poBox);
  }

  Future<String> getMobileNumber() async {
    return await getValueFromSecureStorage('mobileNumber', defaultValue: '');
  }

  Future<String> getnidaNumber() async {
    return await getValueFromStorage('nidaNumber', defaultValue: '');
  }

  Future<String> getCustomerId() async {
    return await getValueFromSecureStorage('customerId', defaultValue: '');
  }

  Future<RegionDetails?> getRegion(
      Function(String) onErrorCallback, UserType userType) async {
    return await executeApiRequest<RegionDetails?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        serviceIdentifier: ICustomerDetailsService.regionIdentifier,
        onError: onErrorCallback,
        requestData: {'userType': userType},
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return RegionDetails.fromJson(data);
        });
  }

  Future<DistrictResponse?> getDistrict(String regionId,
      Function(String) onErrorCallback, UserType userType) async {
    return await executeApiRequest<DistrictResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {"regionId": regionId, 'userType': userType},
        serviceIdentifier: ICustomerDetailsService.districtIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return DistrictResponse.fromJson(data);
        });
  }

  Future<GetCustomerDetailsResponse?> getCustomerDetails(
    Function(String) onErrorCallback,
  ) async {
    int customerId = int.parse(await getCustomerId());

    return await executeApiRequest<GetCustomerDetailsResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          "id": customerId,
        },
        serviceIdentifier: ICustomerDetailsService.customerDetailIdentifier,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;
          return GetCustomerDetailsResponse.fromJson(data);
        });
  }

  Future<CustomerDetailResponse?> updateCustomerDetails(
      String name,
      String dob,
      String gender,
      String address,
      String profession,
      String emailId,
      String poBox,
      String region,
      String district,
      String organizationType,
      Function(String) onErrorCallback,
      UserType userType) async {
    String mobileNO = await getMobileNumber();
    String nidaNo = await getnidaNumber();
    int customerId = int.parse(await getCustomerId());
    CustomerDetailsRequest customerDetailsRequest = CustomerDetailsRequest(
      nidaNo: nidaNo.replaceAll("-", ""),
      mobileNo: mobileNO,
      customerId: customerId,
      firstName: name.split(' ')[0],
      lastName: name.split(' ')[1],
      birthdate: dob,
      gender: gender,
      address: address,
      profession: profession,
      emailId: emailId,
      organization: poBox,
      region: region,
      district: district,
      organizationType: organizationType
    );
    print("//////");
    print({'data': customerDetailsRequest.toJson(), 'userType': userType});
    print("//////");
    return await executeApiRequest<CustomerDetailResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        requestData: {
          'data': customerDetailsRequest.toJson(),
          'userType': userType,
          'postType' : "PUT"
        },
        serviceIdentifier: ICustomerDetailsService.updateCustomerDetails,
        onError: onErrorCallback,
        modelBuilderCallback: (responseData) {
          final data = responseData;

          return CustomerDetailResponse.fromJson(data);
        });
  }

  Future<OrganisationTypeListResponse?> getOrganizationType(
      Function(String) onErrorCallback, UserType userType) async {
    return await executeApiRequest<OrganisationTypeListResponse?>(
        taskType: TaskType.DATA_OPERATION,
        taskSubType: TaskSubType.REST,
        moduleIdentifier: WelcomeModule.moduleIdentifier,
        serviceIdentifier: IDetailsService.getOrganizationTypeIdentifier,
        onError: onErrorCallback,
        requestData: {'userType': userType},
        modelBuilderCallback: (responseData) {
          final data = responseData;
          CrayonPaymentLogger.logInfo("data.toString()");
          CrayonPaymentLogger.logInfo(data.toString());

          return OrganisationTypeListResponse.fromJson(data);
        });
  }
}
