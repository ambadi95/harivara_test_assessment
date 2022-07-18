const find = require('appium-flutter-finder');

module.exports = {
    heading: find.descendant({
        of: find.byValueKey('ReusableInfoRow_Column'),
        matching: find.byValueKey('ReusableInfoRow_Title'),
        firstMatchOnly: true
    }),
    how_to_icon: find.descendant({
        of: find.byValueKey('ReusableInfoRow_Row'),
        matching: find.byValueKey('ReusableInfoRow_Icon'),
        firstMatchOnly: true
    }),
    how_to_text: find.descendant({
        of: find.byValueKey('ReusableInfoRow_Row'),
        matching: find.byValueKey('ReusableInfoRow_Column'),
        firstMatchOnly: true
    }),
    continue_button: find.byValueKey('CrayonPaymentDockedButton_ElevatedButton'),
    back_button: find.byValueKey('BackArrowButtonIcon'),
    list_view: find.byType('ListView')
}
