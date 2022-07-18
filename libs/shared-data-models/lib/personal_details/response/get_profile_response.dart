import 'package:equatable/equatable.dart';

class ProfileResponse extends Equatable {
  final String? customerId;
  final String? mobileNo;
  final String? email;
  final String? firstName;
  final String? secondName;
  final String? thirdName;
  final String? lastName;
  final String? englishFirstName;
  final String? englishSecondName;
  final String? englishThirdName;
  final String? englishLastName;
  final String? fatherName;
  final String? grandFatherName;
  final String? dateOfBirth;
  final String? dateType;
  final String? gender;
  final String? sourceOfIncome;
  final String? iqamaId;
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
  final String? photo;
  final bool? isMobileVerify;
  final bool? isEmailVerify;

  ProfileResponse(
    this.customerId,
    this.mobileNo,
    this.email,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.lastName,
    this.englishFirstName,
    this.englishSecondName,
    this.englishThirdName,
    this.englishLastName,
    this.fatherName,
    this.grandFatherName,
    this.dateOfBirth,
    this.dateType,
    this.gender,
    this.sourceOfIncome,
    this.iqamaId,
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
    this.photo,
    this.isMobileVerify,
    this.isEmailVerify,
  );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        json['customerId'] ?? '',
        json['mobileNo'] ?? '',
        json['email'] ?? '',
        json['firstName'] ?? '',
        json['secondName'] ?? '',
        json['thirdName'] ?? '',
        json['lastName'] ?? '',
        json['englishFirstName'] ?? '',
        json['englishSecondName'] ?? '',
        json['englishThirdName'] ?? '',
        json['englishLastName'] ?? '',
        json['fatherName'] ?? '',
        json['grandFatherName'] ?? '',
        json['dateOfBirth'] ?? '',
        json['dateType'] ?? '',
        json['gender'] ?? '',
        json['sourceOfIncome'] ?? '',
        json['iqamaId'] ?? '',
        json['idExpiryDate'] ?? '',
        json['idIssuePlace'] ?? '',
        json['sponsorName'] ?? '',
        json['nationalityCode'] ?? '',
        json['nationalityName'] ?? '',
        json['jobDesc'] ?? '',
        json['salaryRangeId'] ?? '',
        json['salaryRange'] ?? '',
        json['employmentStatus'] ?? '',
        json['walletId'] ?? '',
        json['photo'] ?? '',
        json['isMobileVerify'] ?? false,
        json['isEmailVerify'] ?? false,
      );

  @override
  List<Object?> get props => [
        customerId,
        mobileNo,
        email,
        firstName,
        secondName,
        thirdName,
        lastName,
        englishFirstName,
        englishSecondName,
        englishThirdName,
        englishLastName,
        fatherName,
        grandFatherName,
        dateOfBirth,
        dateType,
        gender,
        sourceOfIncome,
        iqamaId,
        idExpiryDate,
        idIssuePlace,
        sponsorName,
        nationalityCode,
        nationalityName,
        jobDesc,
        salaryRangeId,
        salaryRange,
        employmentStatus,
        walletId,
        photo,
        isMobileVerify,
        isEmailVerify,
      ];
}
