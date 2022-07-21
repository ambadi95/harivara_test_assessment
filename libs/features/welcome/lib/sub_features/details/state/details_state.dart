import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_state.freezed.dart';

@freezed
class DetailsState with _$DetailsState{
  const factory DetailsState.initialState() = InitialState;

  const factory DetailsState.DetailsFormState(
      bool isValid
      ) = DetailsFormState;

}