class Region {
  final int id;
  final String region;

  const Region(this.id, this.region);

  factory Region.fromJson(Map<String, dynamic> json) =>
      Region(
        json['id'],
        json['region'],
      );
}
