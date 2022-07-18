import {When, Then} from '@cucumber/cucumber';
import cvvPage from '../pages/cvv.page';

When(/^I enter valid CVV$/, function () {
    cvvPage.enterCVV('752');
});

When(/^I click on Add Funds on CVV Page$/, function () {
    cvvPage.clickAddFundsBtn();
});

When(/^I should see confirmation CVV screen$/, function () {
    cvvPage.verifyCVVScreenTitle();
});

Then(/^I should see success message screen$/, function () {
    cvvPage.verifySuccessTitle();
});

Then(/^I see transaction unsuccessful error$/, function () {
    cvvPage.verifyUnsuccessfulTitle();
});

When(/^I should see add Funds on CVV Page$/, function () {
    cvvPage.shouldSeeAddFundsBtn();
});
