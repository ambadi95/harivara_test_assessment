import {When, Then} from '@cucumber/cucumber';
import p2p from '../pages/p2p.page';

Then(/^I should see send money option on the screen$/, function () {
    p2p.shouldSeeP2P();
});

Then(/^I click on p2p link$/, function () {
    p2p.clickP2PLink();
});

Then(/^I should see the below fields on transfer to screen$/, function (table) {
    const tableData = table.raw();
    p2p.shouldSeeTransferToFields(tableData);
});

Then(/^I must be landed to Send Money-Select Recipient screen$/, function () {
    p2p.shouldSeeRecepientPage();
});

Then(/^I select the contact$/, function () {
    p2p.clickContact();
});

Then(/^I should see the searched result$/, function () {
    p2p.shouldSeeContact();
});

When(/^I enter (.*) SAR to pay$/, function (amount) {
    p2p.enterAmount(amount);
});

When(/^I enter (.*) in the search box field$/, function (name) {
    p2p.enterName(name);
});

When(/^I enter (.*) in the mobile search box field$/, function (number) {
    p2p.enterMobileNo(number);
});

When(/^I enter (.*) in passcode field$/, function (passcode) {
    p2p.enterPasscode(passcode);
});

Then(/^I enter the remark$/, function () {
    p2p.enterRemarks();
});

Then(/^I click on send money button$/, function () {
    p2p.clickSendMoney();
});

Then(/^I should see the below fields on payment authorization screen$/, function (table) {
    const tableData = table.raw();
    p2p.shouldSeePasscodeScreen(tableData);
});

Then(/^I should redirected to send money screen$/, function () {
    p2p.shouldSeeSendMoneyPage();
});

Then(/^I should see the below fields on send money$/, function (table) {
    const tableData = table.raw();
    p2p.shouldSeeSendMoneyFields(tableData);
});

Then(/^I should see send money button$/, function () {
    p2p.shouldSeeSendMoneyButton();
});

Then(/^I should be able to make payment$/, function () {
    p2p.clickSendMoneyButton();
});

Then(/^I should see error message for less amount$/, function () {
    p2p.shouldSeeErrorMessage();
});

Then(/^I should see error message for insufficient funds$/, function () {
    p2p.shouldSeeExceedingErrorMessage();
});

Then(/^I should see the message for no contacts$/, function () {
    p2p.shouldSeeErrorNoContacts();
});

Then(/^I click mobile number tab$/, function () {
    p2p.clickMobileNumber();
});

Then(/^I should redirected to payment confirmation screen$/, function () {
    p2p.shouldSeePaymentConfirmation();
});

Then(/^I should see the error message$/, function () {
    p2p.shouldSeeInvalidPasscodeError();
});

Then(/^I should see forgot password popup on the screen$/, function () {
    p2p.shouldSeeForgotPopup();
});

Then(/^I click enter passcode button$/, function () {
    p2p.clickEnterPasscodeLink();
});

Then(/^I should see account locked popup on the screen$/, function () {
    p2p.shouldSeeAccountLockPopup();
});

Then(/^I click on ok button$/, function () {
    p2p.clickOkButton();
});

Then(/^I should see below fields on corfirmation screen$/, function (table) {
    const tableData = table.raw();
    p2p.shouldSeeConfirmationScreenFields(tableData);
});

Then(/^I click download button$/, function () {
    p2p.clickDownloads();
});

Then(/^I click share button$/, function () {
    p2p.clickShareButton();
});

Then(/^I click make another transfer button$/, function () {
    p2p.clickAnotherTransferButton();
});

Then(/^I click on back button in contacts screen$/, function () {
    p2p.clickOnBackButton();
});
