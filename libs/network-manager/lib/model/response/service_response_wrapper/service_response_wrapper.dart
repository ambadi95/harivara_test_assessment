/// Used to relay response result or errors from networking sub services
/// to the state management segment of the code to relay information to the
/// user interface.
class ServiceResponseWrapper<T> {
  T? response;
  String? errorMessage;
}
