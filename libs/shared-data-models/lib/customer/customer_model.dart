class CustomerModel {
  final String? customerId;
  final String? iban;
  final String? email;
  final String? mobileNo;
  final String? firstName;
  final String? lastName;
  final String? englishFirstName;
  final String? englishLastName;
  final String? fatherName;
  final String? grandFatherName;
  final String? dateOfBirth;
  final String? dateType;
  final String? gender;
  final String? iqamaId;
  final String? sourceOfIncome;
  final String? idExpiryDate;
  final String? idIssuePlace;
  final String? sponsorName;
  final String? nationalityCode;
  final String? nationalityName;
  final String? jobDesc;
  final String? salaryRangeId;
  final String? salaryRange;
  final String? employmentStatus;
  final String? walletId;
  final String? address;
  final String? sourceOfWealth;
  final String? sourceOfFunds;
  final String? status;
  final String? message;

  const CustomerModel(
    this.customerId,
    this.iban,
    this.email,
    this.mobileNo,
    this.firstName,
    this.lastName,
    this.englishFirstName,
    this.englishLastName,
    this.fatherName,
    this.grandFatherName,
    this.dateOfBirth,
    this.dateType,
    this.gender,
    this.iqamaId,
    this.sourceOfIncome,
    this.idExpiryDate,
    this.idIssuePlace,
    this.sponsorName,
    this.nationalityCode,
    this.nationalityName,
    this.jobDesc,
    this.salaryRangeId,
    this.salaryRange,
    this.employmentStatus,
    this.walletId,
    this.address,
    this.sourceOfWealth,
    this.sourceOfFunds,
    this.status,
    this.message,
  );

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        json['customerId'] as String?,
        json['iban'] as String?,
        json['email'] as String?,
        json['mobileNo'] as String?,
        json['firstName'] as String?,
        json['lastName'] as String?,
        json['englishFirstName'] as String?,
        json['englishLastName'] as String?,
        json['fatherName'] as String?,
        json['grandFatherName'] as String?,
        json['dateOfBirth'] as String?,
        json['dateType'] as String?,
        json['gender'] as String?,
        json['iqamaId'] as String?,
        json['sourceOfIncome'] as String?,
        json['idExpiryDate'] as String?,
        json['idIssuePlace'] as String?,
        json['sponsorName'] as String?,
        json['nationalityCode'] as String?,
        json['nationalityName'] as String?,
        json['jobDesc'] as String?,
        json['salaryRangeId'] as String?,
        json['salaryRange'] as String?,
        json['employmentStatus'] as String?,
        json['walletId'] as String?,
        json['address'] as String?,
        json['sourceOfWealth'] as String?,
        json['sourceOfFunds'] as String?,
        json['status'] as String?,
        json['message'] as String?,
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customerId'] = customerId;
    _data['iban'] = iban;
    _data['email'] = email;
    _data['mobileNo'] = mobileNo;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['englishFirstName'] = englishFirstName;
    _data['englishLastName'] = englishLastName;
    _data['fatherName'] = fatherName;
    _data['grandFatherName'] = grandFatherName;
    _data['dateOfBirth'] = dateOfBirth;
    _data['dateType'] = dateType;
    _data['gender'] = gender;
    _data['iqamaId'] = iqamaId;
    _data['sourceOfIncome'] = sourceOfIncome;
    _data['idExpiryDate'] = idExpiryDate;
    _data['idIssuePlace'] = idIssuePlace;
    _data['sponsorName'] = sponsorName;
    _data['nationalityCode'] = nationalityCode;
    _data['nationalityName'] = nationalityName;
    _data['jobDesc'] = jobDesc;
    _data['salaryRangeId'] = salaryRangeId;
    _data['salaryRange'] = salaryRange;
    _data['employmentStatus'] = employmentStatus;
    _data['walletId'] = walletId;
    _data['address'] = address;
    _data['sourceOfWealth'] = sourceOfWealth;
    _data['sourceOfFunds'] = sourceOfFunds;
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
