class AgentNearbyModel {
  final String? agentId;
  final String? mobileNo;
  final String? name;
  final String? address;
  final String? imagePath;
  final String? distance;

  const AgentNearbyModel({
    this.agentId,
    this.mobileNo,
    this.name,
    this.address,
    this.imagePath,
    this.distance,
  });

  factory AgentNearbyModel.fromJson(Map<String, dynamic> json) => AgentNearbyModel(
        agentId: json['agentId'],
        mobileNo: json['mobileNo'],
        name: json['name'],
        address: json['address'],
        imagePath: json['imagePath'],
        distance: json['distance'],
  );


}
