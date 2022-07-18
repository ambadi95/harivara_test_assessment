const find = require('appium-flutter-finder');

module.exports = {
    cvv_text_field: keyToPress => find.byText(keyToPress),
    cvv_textbox: find.byValueKey('obscuredEntryField'),
    wait_screen_txt: find.byValueKey('bottomButtonText'),
    add_funds_btn: find.byText('Add funds'),
    cvv_screen_title: find.byValueKey('confirm-screen-title'),
    success_screen_title: find.byText('Congratulations!'),
    error_message: find.byText('Error message')
}
