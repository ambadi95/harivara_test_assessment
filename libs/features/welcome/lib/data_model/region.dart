class Region {
  final int id;
  final String name;

  const Region(this.id, this.name);

  factory Region.fromJson(Map<String, dynamic> json) =>
      Region(
        json['id'],
        json['name'],
      );
}
