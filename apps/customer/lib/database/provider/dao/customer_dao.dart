import 'package:crayon_payment_customer/database/constants/db_constants.dart';
import 'package:crayon_payment_customer/database/model/customer_data_model.dart';
import 'package:crayon_payment_customer/database/provider/dao/dao.dart';



class CustomerDao implements Dao<CustomerData> {
  final tableName = dbTableName;
  final id = 'id';
  final nidaNumber = 'nidanumber';
  final mobileNumber = 'mobileNumber';
  final name = 'name';
  final dob = 'dob';
  final gender = 'gender';
  final emailId = 'emailId';
  final address = 'address';
  final poBox = 'poBox';
  final region = 'region';
  final district = 'district';
  final referralCode = 'referralCode';
  final passcode = 'passcode';
  final otp = 'otp';
  final profession = 'profession';
  final attemptsLeft = 'attemptsLeft';
  final createdAt = 'createdAt';
  final updatedAt = 'updatedAt';
  final enrollmentId = 'enrollmentId';
  final loginType = 'loginType';
  final languageUsed = 'en';
  final isVerified = 'isVerified';

  @override
  String get createTableQuery =>
      'CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,'
      ' $nidaNumber TEXT DEFAULT NULL,'
      ' $mobileNumber TEXT  DEFAULT NULL,'
      ' $name TEXT  DEFAULT NULL,'
      ' $dob TEXT  DEFAULT NULL,'
      ' $gender INTEGER DEFAULT $male,'
      ' $emailId TEXT  DEFAULT NULL,'
      ' $address TEXT  DEFAULT NULL,'
      ' $poBox TEXT  DEFAULT NULL,'
      ' $region TEXT  DEFAULT NULL,'
      ' $district TEXT  DEFAULT NULL,'
      ' $referralCode TEXT  DEFAULT NULL,'
      ' $passcode TEXT  DEFAULT NULL,'
      ' $otp INTEGER DEFAULT 0,'
      ' $profession TEXT DEFAULT NULL,'
      ' $attemptsLeft INTEGER DEFAULT $maxAttempts,'
      ' $createdAt TEXT  DEFAULT NULL,'
      ' $updatedAt TEXT  DEFAULT NULL,'
      ' $enrollmentId TEXT  DEFAULT NULL,'
      ' $loginType INTEGER  DEFAULT 0,'
      ' $languageUsed TEXT  DEFAULT NULL,'
      ' $isVerified INTEGER DEFAULT 0)';

  @override
  CustomerData fromMap(Map<String, dynamic>? query) {
    CustomerData customerData = CustomerData();
    customerData.id = query![id];
    customerData.nidaNumber = query[nidaNumber];
    customerData.mobileNumber = query[mobileNumber];
    customerData.name = query[name];
    customerData.dob = query[dob];
    customerData.gender = query[gender];
    customerData.emailId = query[emailId];
    customerData.address = query[address];
    customerData.poBox = query[poBox];
    customerData.region = query[region];
    customerData.district = query[district];
    customerData.referralCode = query[referralCode];
    customerData.passcode = query[passcode];
    customerData.otp = query[otp];
    customerData.profession = query[profession];
    customerData.attemptsLeft = query[attemptsLeft];
    customerData.createdAt = query[createdAt];
    customerData.updatedAt = query[updatedAt];
    customerData.enrollmentId = query[enrollmentId];
    customerData.loginType = query[loginType];
    customerData.languageUsed = query[languageUsed];
    customerData.isVerified = query[isVerified];
    return customerData;
  }

  @override
  Map<String, dynamic> toMap(CustomerData object) {
    return <String, dynamic>{
      nidaNumber: object.nidaNumber,
      mobileNumber: object.mobileNumber,
      name: object.name,
      mobileNumber: object.mobileNumber,
      dob: object.dob,
      gender: object.gender,
      emailId: object.emailId,
      address: object.address,
      poBox: object.poBox,
      region: object.region,
      district: object.district,
      referralCode: object.referralCode,
      passcode: object.passcode,
      otp: object.otp,
      profession: object.profession,
      attemptsLeft: object.attemptsLeft,
      createdAt: object.createdAt,
      updatedAt: object.updatedAt,
      enrollmentId: object.enrollmentId,
      loginType: object.loginType,
      languageUsed: object.languageUsed,
      isVerified: object.isVerified,
    };
  }

  @override
  List<CustomerData> fromList(List<Map<String, dynamic>> query) {
    List<CustomerData>? customerDataList = [];
    for (Map<String, dynamic> map in query) {
      customerDataList.add(fromMap(map));
    }
    return customerDataList;
  }
}
