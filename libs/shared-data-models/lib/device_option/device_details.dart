class DeviceDetailsModel {
  final String? brand;
  final String? model;
  final String? storage;
  final String? chip;
  final String? os;
  final String? price;
  final String? monthlyPrice;
  final String? imagePath;
  final String? humanInterfaceInput;
  final String? wirelessCarrier;
  final String? cellularTechnology;
  final String? waterResistanceLevel;
  final String? colour;
  final String? interest;
  final String? amountToPaid;

  const DeviceDetailsModel({
    this.brand,
    this.model,
    this.storage,
    this.chip,
    this.os,
    this.price,
    this.monthlyPrice,
    this.imagePath,
    this.humanInterfaceInput,
    this.wirelessCarrier,
    this.cellularTechnology,
    this.waterResistanceLevel,
    this.colour,
    this.interest,
    this.amountToPaid,
  });

  factory DeviceDetailsModel.fromJson(Map<String, dynamic> json) =>
      DeviceDetailsModel(
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
