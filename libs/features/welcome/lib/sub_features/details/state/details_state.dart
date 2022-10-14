import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_data_models/customer_onboard/region_district/region_response/datum.dart';
import 'package:shared_data_models/customer_onboard/region_district/district_response/datum.dart'
    as b;
import 'package:welcome/data_model/district.dart';

import '../../../data_model/gender_type.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initialState() = InitialState;

  const factory DetailsState.successState() = SuccessState;

  const factory DetailsState.DetailsFormState(bool isValid) = DetailsFormState;

  const factory DetailsState.LoadingState() = LoadingState;

  const factory DetailsState.nameError(String nameError) = NameError;

  const factory DetailsState.getMobileNumber(String mobileNumber) =
      GetMobileNumber;

  const factory DetailsState.getNIDANumber(String NIDANumber) = getNIDANumber;

  const factory DetailsState.emailError(String emailError) = EmailError;

  const factory DetailsState.poBoxError(String poBoxError) = PoBoxError;

  const factory DetailsState.dobError(String dobError) = DobError;

  const factory DetailsState.genderError(String genderError) = GenderError;

  const factory DetailsState.professionError(String professionError) =
      ProfessionError;

  const factory DetailsState.addressError(String addressError) = AddressError;

  const factory DetailsState.regionError(String addressError) = RegionError;

  const factory DetailsState.districtError(String districtError) =
      DistrictError;

  const factory DetailsState.organizationTypeError(
      String organizationTypeError) = OrganizationTypeError;

  const factory DetailsState.onGenderTypeChoosen(GenderType genderType) =
      GenderTypeChoosen;

  const factory DetailsState.onRegionChoosen(Datum region) = RegionChoosen;

  const factory DetailsState.onDistrictChoosen(b.Datum district) =
      DistrictChoosen;

  const factory DetailsState.onOrganizationTypeChoosen(
      String organizationType) = onOrganizationTypeChoosen;

  const factory DetailsState.onGenderTypeFetched(String genderType) =
      OnGenderTypeFetched;

  const factory DetailsState.onRegionFetched(String genderType) =
      OnRegionFetched;

  const factory DetailsState.onDistrictFetched(String genderType) =
      OnDistrictFetched;

  const factory DetailsState.onOrganizationTypeFetched(String organizationType) =
  OnOrganizationTypeFetched;
}
