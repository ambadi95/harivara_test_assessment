import 'package:equatable/equatable.dart';

class CreateCustomerRequest extends Equatable {
  final String? iqamaId;
  final String? mobileNo;
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
  final String? idExpiryDate;
  final String? jobDesc;
  final String? idIssuePlace;
  final String? sponsorName;
  final String? nationalityCode;
  final String? employmentStatus;
  final String? sourceOfIncome;
  final String? salaryRange;
  final String? password;
  final String? confirmPassword;

  const CreateCustomerRequest({
    this.iqamaId,
    this.mobileNo,
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
    this.idExpiryDate,
    this.jobDesc,
    this.idIssuePlace,
    this.sponsorName,
    this.nationalityCode,
    this.employmentStatus,
    this.sourceOfIncome,
    this.salaryRange,
    this.password,
    this.confirmPassword,
  });

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      CreateCustomerRequest(
        iqamaId: json['iqamaId'] as String?,
        mobileNo: json['mobileNo'] as String?,
        firstName: json['firstName'] as String?,
        secondName: json['secondName'] as String?,
        thirdName: json['thirdName'] as String?,
        lastName: json['lastName'] as String?,
        fatherName: json['fatherName'] as String,
        grandFatherName: json['grandFatherName'] as String?,
        englishFirstName: json['englishFirstName'] as String?,
        englishSecondName: json['englishSecondName'] as String?,
        englishThirdName: json['englishThirdName'] as String?,
        englishLastName: json['englishLastName'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        dateType: json['dateType'] as String?,
        gender: json['gender'] as String?,
        idExpiryDate: json['idExpiryDate'] as String?,
        jobDesc: json['jobDesc'] as String?,
        idIssuePlace: json['idIssuePlace'] as String?,
        sponsorName: json['sponsorName'] as String?,
        nationalityCode: json['nationalityCode'] as String?,
        employmentStatus: json['employmentStatus'] as String?,
        sourceOfIncome: json['sourceOfIncome'] as String?,
        salaryRange: json['salaryRange'] as String?,
        password: json['password'] as String?,
        confirmPassword: json['confirmPassword'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'iqamaId': iqamaId,
        'mobileNo': mobileNo,
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
        'idExpiryDate': idExpiryDate,
        'jobDesc': jobDesc,
        'idIssuePlace': idIssuePlace,
        'sponsorName': sponsorName,
        'nationalityCode': nationalityCode,
        'employmentStatus': employmentStatus,
        'sourceOfIncome': sourceOfIncome,
        'salaryRange': salaryRange,
        'password': password,
        'confirmPassword': confirmPassword,
      };

  @override
  List<Object?> get props => [
        iqamaId,
        mobileNo,
        firstName,
        secondName,
        thirdName,
        lastName,
        fatherName,
        grandFatherName,
        englishFirstName,
        englishSecondName,
        englishThirdName,
        englishLastName,
        dateOfBirth,
        dateType,
        gender,
        idExpiryDate,
        jobDesc,
        idIssuePlace,
        sponsorName,
        nationalityCode,
        employmentStatus,
        sourceOfIncome,
        salaryRange,
        password,
        confirmPassword,
      ];
}
