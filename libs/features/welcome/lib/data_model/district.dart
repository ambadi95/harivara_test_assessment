class District {
  final int id;
  final String district;

  const District(this.id, this.district);

  factory District.fromJson(Map<String, dynamic> json) => District(
        json['id'],
        json['district'],
      );
}
