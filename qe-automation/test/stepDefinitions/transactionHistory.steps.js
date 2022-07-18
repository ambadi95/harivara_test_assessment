import {Then} from '@cucumber/cucumber';
import transactionHistory from '../pages/transactionhistory.page';

Then(/^I must be redirected to Transaction History Result screen$/, function () {
    transactionHistory.shouldSeeScanYourCardDetailsPage();
});

Then(/^I click on particular transaction$/, function () {
    transactionHistory.clickTransaction();
});

Then(/^I must see main section$/, function () {
    transactionHistory.shouldSeeMainSection();
});

Then(/^I click to expand the section$/, function () {
    transactionHistory.clickExpandSection();
});

Then(/^I must see download jpg option$/, function () {
    transactionHistory.shouldSeeDownloadOption();
});

Then(/^I click on download jpg option$/, function () {
    transactionHistory.clickDownloadJPG();
});

Then(/^I must be able to see below fields$/, function (table) {
    const tableData = table.raw();
    transactionHistory.shouldSeeRequiredFields(tableData);
});

Then(/^I must see no transaction details available message$/, function () {
    transactionHistory.shouldSeeEmptyTransactionMessage();
});

Then(/^I should see transaction detail screen$/, function () {
    transactionHistory.shouldSeeTransactionDetail();
});

Then(/^I must see share option on the screen$/, function () {
    transactionHistory.shouldSeeShareOption();
});

Then(/^I should see the success popup on the screen$/, function () {
    transactionHistory.shouldSeeSuccessPopup();
});

Then(/^I should be able to share transaction detail$/, function () {
    transactionHistory.clickShareOption();
});

Then(/^I click on back button in transaction history page$/, function () {
    transactionHistory.clickOnBackButton();
});
