class GenderType {
  final int id;
  final String gender;

  const GenderType(this.id, this.gender);

  factory GenderType.fromJson(Map<String, dynamic> json) =>
      GenderType(
        json['id'],
        json['gender'],
      );
}
