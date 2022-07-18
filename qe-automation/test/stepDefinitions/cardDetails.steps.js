import {When, Then} from '@cucumber/cucumber';
import cardDetailsPage from '../pages/cardDetails.page';

Then(/^I should be navigated to card details page$/, function () {
    cardDetailsPage.shouldSeeCardDetailsPage();
});

Then(/^I should see below fields required for card details$/, function (table) {
    const tableData = table.raw();
    cardDetailsPage.shouldSeeCardDetailFields(tableData);
});

When(/^I enter all the card details$/, function (table) {
    const tableData = table.raw();
    cardDetailsPage.enterNickname(tableData[1][0]);
    cardDetailsPage.enterCardNumber(tableData[1][1]);
    cardDetailsPage.enterExpiryDate(tableData[1][2]);
    cardDetailsPage.enterCvv(tableData[1][3]);
    cardDetailsPage.setPreferredCard(tableData[1][4]);
});

Then(/^I validate data being entered into the card detail fields$/, function (table) {
    const tableData = table.hashes();
    cardDetailsPage.validateFieldData(tableData);
});

Then(/^I should see the card scheme for the respective card number below$/, function (table) {
    const tableData = table.hashes();
    cardDetailsPage.isVisibleCardScheme(tableData);
});

Then(/^I should see confirm button is (enabled|disabled) on the card details page$/, function (isEnabled) {
    cardDetailsPage.isEnabledContinueButton(isEnabled === 'enabled');
});

When(/^I continue to add the card with the filled in details$/, function () {
    cardDetailsPage.clickContinueButton();
});

Then(/^I should see card added modal$/, function () {
    cardDetailsPage.shouldSeeAddCardModal();
});

Then(/^I close the add card modal$/, function () {
    cardDetailsPage.closeAddCardModal();
});

Then(/^I should see card not added error modal$/, function () {
    cardDetailsPage.shouldSeeCardNotAddedErrorModal();
});
