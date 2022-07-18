class BankDetailsResponse {
  String? typeName;
  String? bankName;
  String? iBanNumber;

  BankDetailsResponse({this.typeName, this.bankName, this.iBanNumber});

  factory BankDetailsResponse.fromJson(Map<String, dynamic> json) {
    BankDetailsResponse bankDetailsResponse = json.containsKey('status')
        ? BankDetailsResponse(
            typeName: json['__typename'] as String,
          )
        : BankDetailsResponse(
            typeName: json['__typename'] as String,
            bankName: json['bankName'] as String,
            iBanNumber: json['ibanNumber'] as String,
          );
    return bankDetailsResponse;
  }
}
