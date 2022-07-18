const find = require('appium-flutter-finder');

module.exports = {
    heading: find.byValueKey('CrayonPaymentAppBar_Title'),
    card_list_appBar: find.byValueKey('CardListScreen_AppBar'),
    add_card_tile: find.byValueKey('CrayonPaymentAddCardRow_AddCardRow'),
    add_new_card_link: find.descendant({
        of: find.byValueKey('CardListScreen_AddCardButton'),
        matching: find.byValueKey('CrayonPaymentIconTextButton_Text'),
        firstMatchOnly: true
    }),
    info_overlay: find.byValueKey('statusImage'),
    overlay_cancel_button: find.descendant({
        of: find.byValueKey('bottomButtonText'),
        matching: find.byValueKey('CrayonPaymentTextButton_TextButton'),
        firstMatchOnly: true
    }),
    overlay_continue_button: find.descendant({
        of: find.byValueKey('bottomButtonDocked'),
        matching: find.byValueKey('CrayonPaymentDockedButton_ElevatedButton'),
        firstMatchOnly: true
    }),
    cards_list: find.byValueKey('CrayonPaymentCardDetailsHolder'),
    card_logo: find.byValueKey('card_logo'),
    cards_view: find.byValueKey('CrayonPaymentCardDetailsHolder_Cover'),
    card_name: find.descendant({
        of: find.byValueKey('CrayonPaymentCardDetailsHolder_NickName'),
        matching: find.byType('Text'),
        firstMatchOnly: true
    }),
    card_number: find.byValueKey('CrayonPaymentCardDetailsHolder_Number'),
    preferredCard_heading: find.byValueKey('CardListScreen_PreferredCardLabel'),
    greenTick_onPreferredCard: find.byValueKey('CardListScreen_PreferredCardIcon'),
    changeNickName_link: find.byValueKey('CardListScreen_ChangeNickNameButton'),
    DeleteCard_link: find.byValueKey('CardListScreen_DeleteCardButton'),
    Transaction_placeholder: find.byValueKey('CardListScreen_CardTransactions'),
    toggle_button: find.byValueKey('CardListScreen_Toggle'),
    card_expiry_date: find.byValueKey('CrayonPaymentCardDetailsHolder_ExpiryDate'),
    card_preferred_icon: find.byValueKey('CardListScreen_PreferredCardIcon'),
    back_btn: find.byValueKey('CrayonPaymentAppBarButtons_BackArrow')
}
