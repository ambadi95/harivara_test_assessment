import {When, Then} from '@cucumber/cucumber';
import addFundsPage from '../pages/addFunds.page';

Then(/^I should be navigated to the add funds page$/, function () {
    addFundsPage.shouldSeeAddFundsPage();
});

When(/^I proceed to select the card$/, function () {
    addFundsPage.clickCardsList();
});

When(/^I proceed to add a new card$/, function () {
    addFundsPage.clickAddNewCard();
});

When(/^I enter (.*) SAR into the amount field$/, function (amount) {
    addFundsPage.enterAmount(amount);
});

When(/^I add the funds$/, function () {
    addFundsPage.clickAddFundsButton();
});

Then(/^I click on default card$/, function () {
    addFundsPage.clickOnDefaultCard();
});

Then(/^I should see select card model with default card$/, function () {
    addFundsPage.shouldSeeSelectModal();
    addFundsPage.shouldSeeDefaultCard();
});

When(/^I click on secondary card$/, function () {
    addFundsPage.shouldSelectSecondaryCard();
});

Then(/^I should see select card model$/, function () {
    addFundsPage.shouldSeeSelectModal();
});

When(/^I click on close icon on select card modal$/, function () {
    addFundsPage.clickOnClose();
});

When(/^I should see the below fields in the screen$/, function (table) {
    const tableData = table.raw();
    addFundsPage.shouldSeeTheFields(tableData);
});

Then(/^I should see add fund button is (enabled|disabled)$/, function (isEnabled) {
    addFundsPage.addFundButtonIsDisabled(isEnabled === 'enabled');
});

Then(/^I should see below fields$/, function (table) {
    const tableData = table.raw();
    addFundsPage.shouldSeeRequiredFields(tableData);
});

Then(/^I should see error message on the screen$/, function () {
    addFundsPage.shouldSeeErrorMessage();
});

Then(/^I click on back button in add funds page$/, function () {
    addFundsPage.clickBackButton();
});
