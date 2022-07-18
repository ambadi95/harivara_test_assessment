import {When} from '@cucumber/cucumber';
import commonPage from '../pages/common.page';

When(/^I select back button on the top$/, function () {
    commonPage.clickBackButton();
});

// TODO - Validate the scenario for device back button runs for Android only - @android tag works
// TODO - Validate the scenario for Customer runs for customer apps only - @customer tag works
When(/^I click device back button$/, function () {
    commonPage.clickDeviceBackButton();
});

When(/^I relaunch the app$/, function () {
    commonPage.relaunchApp();
});
