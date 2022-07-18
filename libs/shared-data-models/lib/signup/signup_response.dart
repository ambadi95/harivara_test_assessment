class SignupResponse {
  final String? otpRefId;
  final int? otpNumber;
  final String? firstName;
  final String? secondName;
  final String? thirdName;
  final String? lastName;
  final String? fatherName;
  final String? grandFatherName;
  final String? englishFirstName;
  final String? englishSecondName;
  final String? englishThirdName;
  final String? englishLastName;
  final String? dateOfBirth;
  final String? dateType;
  final String? gender;
  final String? iqamaId;
  final String? idExpiryDate;
  final String? nationalityCode;
  final String? nationalityName;
  final String? jobDesc;
  final String? idIssuePlace;
  final String? sponsorName;
  final int? statusCode;
  final String? status;
  final String? message;

  const SignupResponse(
    this.otpRefId,
    this.otpNumber,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.lastName,
    this.fatherName,
    this.grandFatherName,
    this.englishFirstName,
    this.englishSecondName,
    this.englishThirdName,
    this.englishLastName,
    this.dateOfBirth,
    this.dateType,
    this.gender,
    this.iqamaId,
    this.idExpiryDate,
    this.nationalityCode,
    this.nationalityName,
    this.jobDesc,
    this.idIssuePlace,
    this.sponsorName,
    this.statusCode,
    this.status,
    this.message,
  );

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        json['otpRefId'] as String?,
        json['otpNumber'] as int?,
        json['firstName'] as String?,
        json['secondName'] as String?,
        json['thirdName'] as String?,
        json['lastName'] as String?,
        json['fatherName'] as String?,
        json['grandFatherName'] as String?,
        json['englishFirstName'] as String?,
        json['englishSecondName'] as String?,
        json['englishThirdName'] as String?,
        json['englishLastName'] as String?,
        json['dateOfBirth'] as String?,
        json['dateType'] as String?,
        json['gender'] as String?,
        json['iqamaId'] as String?,
        json['idExpiryDate'] as String?,
        json['nationalityCode'] as String?,
        json['nationalityName'] as String?,
        json['jobDesc'] as String?,
        json['idIssuePlace'] as String?,
        json['sponsorName'] as String?,
        json['statusCode'] as int?,
        json['status'] as String?,
        json['message'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'otpRefId': otpRefId,
        'otpNumber': otpNumber,
        'firstName': firstName,
        'secondName': secondName,
        'thirdName': thirdName,
        'lastName': lastName,
        'fatherName': fatherName,
        'grandFatherName': grandFatherName,
        'englishFirstName': englishFirstName,
        'englishSecondName': englishSecondName,
        'englishThirdName': englishThirdName,
        'englishLastName': englishLastName,
        'dateOfBirth': dateOfBirth,
        'dateType': dateType,
        'gender': gender,
        'iqamaId': iqamaId,
        'idExpiryDate': idExpiryDate,
        'jobDesc': jobDesc,
        'idIssuePlace': idIssuePlace,
        'sponsorName': sponsorName,
        'nationalityCode': nationalityCode,
        'nationalityName': nationalityName,
        'statusCode': statusCode,
        'status': status,
        'message': message,
      };
}
