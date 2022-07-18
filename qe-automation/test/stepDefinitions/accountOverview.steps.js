import {When, Then} from '@cucumber/cucumber';
import accountOverviewPage from '../pages/accountOverview.page';

Then(/^I can see my account overview page$/, function () {
    accountOverviewPage.shouldSeeAccountOverviewPage();
});

Then(/^I have an option to add funds on account overview page$/, function () {
    accountOverviewPage.shouldSeeAddFundsOption();
});

When(/^I select the add funds link on the account overview page$/, function () {
    accountOverviewPage.clickAddFunds();
});

Then(/^I click on my account$/, function () {
    accountOverviewPage.clickMyAccount();
});

Then(/^I should see the View Transaction History option$/, function () {
    accountOverviewPage.shouldTransactionHistoryVisible();
});

Then(/^I click on View Transaction history option$/, function () {
    accountOverviewPage.clickTransactionHistoryLink();
});
