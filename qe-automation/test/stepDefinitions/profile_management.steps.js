import {When, Then} from '@cucumber/cucumber';
import profile_managementPage from '../pages/profile_management.page';

Then(/^I click on manage wallet$/, function () {
    profile_managementPage.clickManageWallet();
});

Then(/^I should see manage account screen$/, function () {
    profile_managementPage.shouldSeeManageAccount();
});

When(/^I should see below details on the screen$/, function (table) {
    const tableData = table.raw();
    profile_managementPage.shouldSeeManageWalletDetails(tableData);
});

Then(/^I can see copy detail button$/, function () {
    profile_managementPage.shouldSeeCopyDetailButton();
});

When(/^I click on copy detail button$/, function () {
    profile_managementPage.clickCopyDetailButton();
});

Then(/^I should see popup message for copied details$/, function () {
    profile_managementPage.shouldSeePopupMessage();
});

Then(/^I must see following details on the screen$/, function (table) {
    const tableData = table.raw();
    profile_managementPage.shouldSeeWalletScreenFields(tableData);
});

Then(/^I must see below fields in case of server side error$/, function (table) {
    const tableData = table.raw();
    profile_managementPage.shouldSeeServerSideFields(tableData);
});

When(/^I click on ok button and redirected to homepage$/, function () {
    profile_managementPage.clickOkButton();
});

Then(/^I should see error page details$/, function () {
    profile_managementPage.shouldSeeErrorScreen();
});

Then(/^I must redirected to homepage$/, async function () {
    profile_managementPage.shouldSeeHomepage();
});
