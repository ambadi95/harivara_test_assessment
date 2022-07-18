const find = require('appium-flutter-finder');

module.exports = {
    sign_in_button: find.byValueKey('CrayonPaymentDockedButton_Text'),
    enter_passcode_screen: find.byValueKey('otpWidget'),
    customer_id: find.byValueKey('mobileTextField'),
    passcode: find.byValueKey('passcodeTextField'),
    key_to_press: keyToPress => find.byText(keyToPress),
    sign_in: find.byValueKey('welcomeSignInButton'),
    lang_dropdown: find.byValueKey('language_dropdown'),
    arabic_lang: find.byValueKey('welcomeLanguageText')
}
