abstract class PhoneNumberParser {
  String removeUnwantedChars(
    String rawNumberString, {
    bool removeKSACountryCode = false,
  });

  String formatMobileNumberKSA(String mobileNumber);
}

class PhoneNumberParserImpl implements PhoneNumberParser {
  @override
  String removeUnwantedChars(
    String rawNumberString, {
    bool removeKSACountryCode = false,
  }) {
    final res = rawNumberString
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('+', '')
        .replaceAll(' ', '')
        .replaceAll('-', '');
    return removeKSACountryCode ? res.replaceFirst('966', '') : res;
  }

  @override
  String formatMobileNumberKSA(String mobileNumber) {
    mobileNumber = mobileNumber.replaceAll(' ', '');

    if (mobileNumber.length > 2 && mobileNumber.length < 6) {
      final digitsLeft = mobileNumber.length - 2;

      return mobileNumber.replaceAllMapped(
        RegExp(r'(\d{2})(\d{' + digitsLeft.toString() + '})'),
        (Match m) => '${m[1]} ${m[2]}',
      );
    }
    return mobileNumber.replaceAllMapped(
      RegExp(r'(\d{2})(\d{3})(\d+)'),
      (Match m) => '${m[1]} ${m[2]} ${m[3]}',
    );
  }
}
