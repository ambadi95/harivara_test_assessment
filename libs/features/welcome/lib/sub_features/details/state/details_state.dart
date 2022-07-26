import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState{
  const factory DetailsState.initialState() = InitialState;

  const factory DetailsState.DetailsFormState(
      bool isValid
      ) = DetailsFormState;

  const factory DetailsState.nameError(
      String nameError
      ) = NameError;

  const factory DetailsState.getMobileNumber(
      String mobileNumber
      ) = GetMobileNumber;

  const factory DetailsState.emailError(
      String emailError
      ) = EmailError;

  const factory DetailsState.poBoxError(
      String poBoxError
      ) = PoBoxError;

  const factory DetailsState.dobError(
      String dobError
      ) = DobError;

  const factory DetailsState.genderError(
      String genderError
      ) = GenderError;

  const factory DetailsState.professionError(
      String professionError
      ) = ProfessionError;

  const factory DetailsState.addressError(
      String addressError
      ) = AddressError;

  const factory DetailsState.regionError(
      String addressError
      ) = RegionError;

  const factory DetailsState.districtError(
      String districtError
      ) = DistrictError;
}