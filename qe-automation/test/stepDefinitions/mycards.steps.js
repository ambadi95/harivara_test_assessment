import {When, Then} from '@cucumber/cucumber';
import myCardsPage from '../pages/mycards.page';

Then(/^I should be navigated to my card landing page$/, function () {
    myCardsPage.shouldSeeCardListPage();
});

Then(/^I should see the add a card (tile|link)$/, function (type) {
    type === 'tile' ?
        myCardsPage.shouldSeeAddACardTile() :
        myCardsPage.shouldSeeAddACardLink();
});

When(/^I select the add a card tile$/, function () {
    myCardsPage.clickAddACardTile();
});

Then(/^I click on add new card link$/, function () {
    myCardsPage.clickAddNewCardLink();
});

Then(/^I should see the add card information overlay$/, function () {
    myCardsPage.shouldSeeAddCardOverlay();
});

Then(/^I select (cancel|continue) button on the add card overlay$/, function (button) {
    button === 'cancel' ?
        myCardsPage.clickOverlayCancelButton() :
        myCardsPage.clickOverlayContinueButton();
});

Then(/^I should (see|not see) any added cards in my cards list$/, function (isVisible) {
    myCardsPage.isVisibleCardsList(isVisible === 'see');
});

When(/^I select back button on the my card page$/, function () {
    myCardsPage.clickBackButton();
});

When(/^I should see my cards page$/, function () {
    myCardsPage.shouldSeeCardListPage();
});

Then(/^I should see below details for added cards$/, function (table) {
    const tableData = table.raw();
    myCardsPage.shouldSeeCardInformation(tableData);
});

Then(/^I should (see|not see) the below card as the default card in my cards list$/, function (isDefault, table) {
    const tableData = table.hashes();
    myCardsPage.shouldSeeCardWithDetails(tableData, isDefault === 'see');
});

Then(/^I should not see toggle button on the screen$/, function () {
    myCardsPage.shouldNotSeeToggleButton();
});
