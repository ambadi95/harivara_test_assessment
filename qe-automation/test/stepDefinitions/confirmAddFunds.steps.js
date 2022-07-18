import {Then} from '@cucumber/cucumber';
import confirmAddFunds from '../pages/confirmAddFunds.page';

Then(/^I click on Add Funds Btn in Confirm Screen$/, function () {
    confirmAddFunds.clickAddFunds();
});

Then(/^I click on back button in add funds confirm page$/, function () {
    confirmAddFunds.clickBackButton();
});
