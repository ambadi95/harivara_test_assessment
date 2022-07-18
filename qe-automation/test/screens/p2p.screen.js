const find = require('appium-flutter-finder');

module.exports = {
    p2p_link: find.bySemanticsLabel('P2P Payments'),
    recepient_heading: find.byValueKey('P2PPaymentsScreen_Title'),
    contacts_tab: find.byText('Contacts'),
    mobileNumber_Tab: find.byText('Mobile number'),
    Search_bar: find.byValueKey('contacts_search'),
    search_mobileNumber: find.byValueKey('mobileNumber_search'),
    error_noContacts: find.byText('Sorry, no contacts were found. Try another name'),
    contact: find.byValueKey('title'),
    amount: find.byValueKey('amountTextField'),
    sendMoneyPage: find.byValueKey('SendMoneyScreen_Title'),
    // contact_name: find.byValueKey('SearchHighlightedListTile_Title_StandardText'),
    contact_name: find.descendant({
        of: find.byValueKey('P2PPaymentsScreen_Contacts'),
        matching: find.byValueKey('SearchHighlightedListTile_Title_StandardText'),
        firstMatchOnly: true
    }),
    contact_number: find.byValueKey('subtitle'),
    wallet_balance: find.byValueKey('balanceText'),
    amount_field: find.byValueKey('amountTextField'),
    sendMoney: find.byValueKey('SendMoneyScreen_SendMoneyButton'),
    remark: find.byValueKey('text-field'),
    payment_heading: find.byValueKey('PaymentAuthorizationScreen_Title'),
    payment_subheading: find.byValueKey('PaymentAuthorizationScreen_SubTitle'),
    passcode_payment: find.byValueKey('PaymentAuthorizationScreen_PasscodeInput'),
    face_id: find.byValueKey('PaymentAuthorizationScreen_FaceId'),
    forgot_passcode: find.byValueKey('PaymentAuthorizationScreen_ForgotPasscode'),
    incorrect_passcode: find.byValueKey('Incorrect passcode. Please try again.'),
    payment_confirmation: find.byValueKey('PaymentConfirmationScreen_TitleScreenshot'),
    amount_confirm: find.byValueKey('PaymentConfirmationScreen_Amount_Info'),
    date_time: find.byValueKey('PaymentConfirmationScreen_DateTime_Info'),
    reference: find.byValueKey('PaymentConfirmationScreen_Reference_Info'),
    note: find.byValueKey('PaymentConfirmationScreen_Note_Info'),
    key_to_press: keyToPress => find.byText(keyToPress),
    errorMessage: find.byValueKey('errorText'),
    // errormessage2: find.byType('needs to be over 1'),
    enterPasscode_link: find.byValueKey('bottomButtonText'),
    ok_button: find.byValueKey('CrayonPaymentDockedButton_ElevatedButton'),
    download_btn: find.byValueKey('PaymentConfirmationScreen_DownloadButton'),
    share_btn: find.byValueKey('PaymentConfirmationScreen_ShareButton'),
    make_another_transfer_btn: find.byText('Make another transfer'),
    back_button: find.byValueKey('CrayonPaymentAppBar_GestureDetector0_false')
}
