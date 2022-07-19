
import 'package:crayon_payment_customer/database/constants/db_constants.dart';

class CustomerData {
  int? id;
  String? nidaNumber;
  String? mobileNumber;
  String? name;
  String? dob;
  int? gender=male;
  String? emailId;
  String? address;
  String? poBox;
  String? region;
  String? district;
  String? referralCode;
  String? passcode;
  int? otp=defaultOTP;
  String? profession;
  int? attemptsLeft =maxAttempts;
  String? createdAt = DateTime.now().toString();
  String? updatedAt = DateTime.now().toString();
  String? enrollmentId;
  int? loginType=0;
  String? languageUsed;
  int? isVerified=0;

  CustomerData({
    this.id,
    this.nidaNumber,
    this.mobileNumber,
    this.name,
    this.dob,
    this.gender,
    this.emailId,
    this.address,
    this.poBox,
    this.region,
    this.district,
    this.referralCode,
    this.passcode,
    this.otp,
    this.profession,
    this.attemptsLeft,
    this.createdAt,
    this.updatedAt,
    this.enrollmentId,
    this.loginType,
    this.languageUsed,
    this.isVerified,});

  CustomerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nidaNumber = json['nida_number'];
    mobileNumber = json['mobile_number'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    emailId = json['email_id'];
    address = json['address'];
    poBox = json['po_box'];
    region = json['region'];
    district = json['district'];
    referralCode = json['referral_code'];
    passcode = json['passcode'];
    otp = json['otp'];
    profession = json['profession'];
    attemptsLeft = json['attempts_left'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    enrollmentId = json['enrollment_id'];
    loginType = json['login_type'];
    languageUsed = json['language_used'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['nida_number'] = nidaNumber;
    data['mobile_number'] = mobileNumber;
    data['name'] = name;
    data['dob'] = dob;
    data['gender'] = gender;
    data['email_id'] = emailId;
    data['address'] = address;
    data['po_box'] = poBox;
    data['region'] = region;
    data['district'] = district;
    data['referral_code'] = referralCode;
    data['passcode'] = passcode;
    data['otp'] = otp;
    data['profession'] = profession;
    data['attempts_left'] = attemptsLeft;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['enrollment_id'] = enrollmentId;
    data['login_type'] = loginType;
    data['language_used'] = languageUsed;
    data['is_verified'] = isVerified;
    return data;
  }
}
