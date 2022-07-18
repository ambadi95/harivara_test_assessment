class MerchantDetails {
  MerchantDetails({
    required this.name,
    required this.type,
    required this.logo,
    required this.address,
    required this.contact,
    required this.merchantID,
  });

  late final String name;
  late final String type;
  late final String logo;
  late final String address;
  late final String contact;
  late final String merchantID;

  MerchantDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
    if (json['address'] == null) {
      address = '';
    } else {
      address = json['address'];
    }
    contact = json['contact'];
    if (json['merchantID'] == null) {
      merchantID = '';
    } else {
      merchantID = json['merchantID'];
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['type'] = type;
    _data['logo'] = logo;
    _data['address'] = address;
    _data['contact'] = contact;
    _data['merchantID'] = merchantID;
    return _data;
  }
}
