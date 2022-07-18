import {When, Then} from '@cucumber/cucumber';
import howToLinkACardPage from '../pages/howToLinkACard.page';

Then(/^I should (be|not be) navigated to How to link a card page$/, function (isVisible) {
    howToLinkACardPage.shouldSeeHowToLinkACardPage(isVisible === 'be');
});

Then(/^I should (see|not see) the how to description with static text and image$/, function (isVisible) {
    howToLinkACardPage.isVisibleHowToDescription(isVisible === 'see');
});

Then(/^I should see the continue button below the how to description$/, function () {
    howToLinkACardPage.isVisibleContinueButton();
});

When(/^I continue from the how to link a card screen$/, function () {
    howToLinkACardPage.clickContinueButton();
});

When(/^I go back from the how to link a card screen$/, function () {
    howToLinkACardPage.clickBackButton();
});
