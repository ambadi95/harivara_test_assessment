import {When, Then} from '@cucumber/cucumber';
import scanYourCardDetailsPage from '../pages/scanYourCardDetails.page';

Then(/^I should be navigated to scan your card details page$/, function () {
    scanYourCardDetailsPage.shouldSeeScanYourCardDetailsPage();
});

Then(/^I should see enter card details manually link$/, function () {
    scanYourCardDetailsPage.shouldSeeEnterCardDetailsManuallyLink();
});

When(/^I select to enter my card details manually$/, function () {
    scanYourCardDetailsPage.clickEnterCardDetailsManually();
});

When(/^I go back from the scan card details screen$/, function () {
    scanYourCardDetailsPage.clickBackButton();
});
