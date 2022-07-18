abstract class CreateResponse {
  final String? serviceRequestId;
  final String? message;
  final String? status;
  final String? userId;

  CreateResponse({
    this.serviceRequestId,
    this.message,
    this.status,
    this.userId,
  });
}
