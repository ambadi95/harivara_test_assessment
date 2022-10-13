import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:welcome/data_model/district.dart';

import '../../../data_model/gender_type.dart';

part 'customer_details_state.freezed.dart';

@freezed
class CustomerDetailsState with _$CustomerDetailsState {
  const factory CustomerDetailsState.initialState() = InitialState;

  const factory CustomerDetailsState.successState() = SuccessState;

  const factory CustomerDetailsState.DetailsFormState(bool isValid) =
      DetailsFormState;

  const factory CustomerDetailsState.LoadingState() = LoadingState;

  const factory CustomerDetailsState.nameError(String nameError) = NameError;

  const factory CustomerDetailsState.getMobileNumber(String mobileNumber) =
      GetMobileNumber;

  const factory CustomerDetailsState.emailError(String emailError) = EmailError;

  const factory CustomerDetailsState.poBoxError(String poBoxError) = PoBoxError;

  const factory CustomerDetailsState.dobError(String dobError) = DobError;

  const factory CustomerDetailsState.genderError(String genderError) =
      GenderError;

  const factory CustomerDetailsState.professionError(String professionError) =
      ProfessionError;

  const factory CustomerDetailsState.addressError(String addressError) =
      AddressError;

  const factory CustomerDetailsState.regionError(String addressError) =
      RegionError;

  const factory CustomerDetailsState.districtError(String districtError) =
      DistrictError;

  const factory CustomerDetailsState.organizationTypeError(
      String organizationTypeError) = OrganizationTypeError;

  const factory CustomerDetailsState.onGenderTypeChoosen(
      GenderType genderType) = GenderTypeChoosen;

  const factory CustomerDetailsState.onRegionChoosen(Datum region) =
      RegionChoosen;

  const factory CustomerDetailsState.onDistrictChoosen(b.Datum district) =
      DistrictChoosen;

  const factory CustomerDetailsState.onOrganizationTypeChoosen(
      String organizationType) = onOrganizationTypeChoosen;

  const factory CustomerDetailsState.getRegion(
    String selectedRegion,
  ) = GetSelectedRegion;

  const factory CustomerDetailsState.getDistrict(
    String selectedDistrict,
  ) = GetSelectedDistrict;
}
