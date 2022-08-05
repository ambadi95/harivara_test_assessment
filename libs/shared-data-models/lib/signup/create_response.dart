abstract class CreateResponse {
  final String? serviceRequestId;
  final String? message;
  final String? status;
  final String? userId;
  final String? serviceFlow;

  CreateResponse({
    this.serviceRequestId,
    this.message,
    this.status,
    this.userId,
    this.serviceFlow,
  });

  // TODO: Should be using a freezed class here for the status
  bool get isSucceeded =>
      status?.toLowerCase() == 'succeeded' || status?.toLowerCase() == 'paused';
}
