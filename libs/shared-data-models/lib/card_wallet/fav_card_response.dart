class FavCardResponse {
  final bool favourite;

  FavCardResponse(this.favourite);

  factory FavCardResponse.fromJson(Map<String, dynamic> json) =>
      FavCardResponse(
        json['favourite'] as bool,
      );
}
