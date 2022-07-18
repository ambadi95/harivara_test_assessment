class DeleteCardResponse {
  final bool delete;

  DeleteCardResponse(this.delete);

  factory DeleteCardResponse.fromJson(Map<String, dynamic> json) =>
      DeleteCardResponse(
        json['delete'] as bool,
      );
}
