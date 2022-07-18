const find = require('appium-flutter-finder');

module.exports = {
    heading: find.byValueKey('CardDetailsView_title'),
    nickname: find.descendant({
        of: find.byValueKey('CardDetailsView_nickname'),
        matching: find.byValueKey('DefaultInputField_text_field'),
        firstMatchOnly: true
    }),
    card_number: find.descendant({
        of: find.byValueKey('CardDetailsView_card_number'),
        matching: find.byValueKey('DefaultInputField_text_field'),
        firstMatchOnly: true
    }),
    card_scheme_mada: find.byValueKey('icon_mada.svg'),
    card_scheme_visa: find.byValueKey('icon_visa.svg'),
    card_scheme_mastercard: find.byValueKey('icon_mastercard.svg'),
    card_scheme_chinaUnionPay: find.byValueKey('icon_union_pay.svg'),
    card_scheme_amex: find.byValueKey('icon_amex.svg'),
    card_scheme_dinersClub: find.byValueKey('icon_diners.svg'),
    card_scheme_dinersClubIntl: find.byValueKey('icon_diners.svg'),
    card_expiry_date: find.descendant({
        of: find.byValueKey('CardDetailsView_expiration_date'),
        matching: find.byValueKey('DefaultInputField_text_field'),
        firstMatchOnly: true
    }),
    picker_wheel_done: find.byValueKey('PickerWidget_Done'),
    card_cvv: find.descendant({
        of: find.byValueKey('CardDetailsView_cvv'),
        matching: find.byValueKey('DefaultInputField_text_field'),
        firstMatchOnly: true
    }),
    card_scheme: find.byValueKey('DefaultInputField_accessory_container'),
    preferred_card: find.byValueKey('CardDetailsView_switch'),
    continue_button: find.byValueKey('CardDetailsView_continue'),
    expiry_date_android: '//android.view.View[4]',
    expiry_date_ios: '//XCUIElementTypeImage/preceding-sibling::XCUIElementTypeOther[1]',
    card_added_modal: find.byValueKey('statusImage'),
    modal_close_Icon: find.descendant({
        of: find.byValueKey('iconCloseButton'),
        matching: find.byType('SvgPicture'),
        firstMatchOnly: true
    }),
    card_error_modal: find.byValueKey('statusImage')
}
