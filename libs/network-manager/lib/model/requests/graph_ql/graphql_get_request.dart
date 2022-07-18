enum CachePolicy {
  None,
  OnDemand,
}

enum GraphQlRequestType {
  mutate,
  query,
}

class GraphQLRequest {
  final String request;
  final String? key;
  final GraphQlRequestType type;
  final Map<String, String>? additionalHeaders;
  final CachePolicy cachePolicy;

  /// Show a 'busy' modal dialog to prevent user interaction
  final bool showBusy;

  /// The delay before showing a 'busy' modal dialog
  final int showBusyDelayInMilliseconds;

  /// The name of the query/mutation that can be used to determine which endpoint to use.
  /// See the `src\assets\configuration\network_configuration.json` file for the endpoint
  /// mapping configuration
  final String name;

  final Map<String, dynamic>? variables;

  GraphQLRequest(
    this.request,
    this.type, {
    required this.name,
    this.key,
    this.variables,
    this.showBusy = true,
    this.showBusyDelayInMilliseconds = 0,
    this.additionalHeaders,
    this.cachePolicy = CachePolicy.None,
  });
}
