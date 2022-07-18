import {Then} from '@cucumber/cucumber';
import errorPage from '../pages/error.page';

Then(/^I should be navigated to an error page$/, function () {
    errorPage.shouldSeeErrorPage();
});

Then(/^I should see the error message on the page$/, function () {
    errorPage.shouldSeeErrorMessage();
});
