import {Given, When} from '@cucumber/cucumber';
import loginPage from '../pages/login.page';

Given(/^I am on the login page$/, function () {
    loginPage.shouldSeeLoginPage();
});

When(/^I login with the (.*) user$/, function (userType) {
    loginPage.setUserDetails(userType);
    loginPage.enterUsername();
    loginPage.enterPassword();
    loginPage.clickLoginButton();
});
