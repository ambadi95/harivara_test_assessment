class DeviceOptionModel {
  final String? brand;
  final String? model;
  final String? storage;
  final String? chip;
  final String? os;
  final String? price;
  final String? monthlyPrice;
  final String? imagePath;

  const DeviceOptionModel({
    this.brand,
    this.model,
    this.storage,
    this.chip,
    this.os,
    this.price,
    this.monthlyPrice,
    this.imagePath,
  });

  factory DeviceOptionModel.fromJson(Map<String, dynamic> json) =>
      DeviceOptionModel(
        brand: json['brand'],
        model: json['model'],
        storage: json['storage'],
        chip: json['chip'],
        os: json['os'],
        price: json['price'],
        monthlyPrice: json['monthlyPrice'],
        imagePath: json['imagePath'],
      );
}
