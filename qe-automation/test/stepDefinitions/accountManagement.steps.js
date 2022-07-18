import {When, Then} from '@cucumber/cucumber';
import accountManagement from '../pages/accountManagement.page';

Then(/^I click on manage cards$/, function () {
    accountManagement.clickManageCards();
});

When(/^I should see manage account page$/, function () {
    accountManagement.shouldSeeAccountManagementPage();
});
