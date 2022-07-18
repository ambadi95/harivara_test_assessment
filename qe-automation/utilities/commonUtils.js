const testDataFile = require('./testData.json');

module.exports = {
    setUserData(userType) {
        global.testData = testDataFile[userType];
    },

    clickOnElement(loc) {
        if (this.isVisibleElement(loc)) {
            browser.elementClick(loc);
        } else {
            throw new Error(`Element ${loc} not visible.`);
        }
    },

    clearTextField(loc) {
        browser.elementClear(loc);
    },

    enterText(loc, text) {
        if (this.isVisibleElement(loc)) {
            browser.elementSendKeys(loc, text);
        } else {
            throw new Error(`Element ${loc} not visible.`);
        }
    },

    isVisibleElement(loc) {
        try {
            browser.execute('flutter:waitFor', loc, 5);
            return true;
        } catch (exception) {
            return false;
        }
    },

    waitForElement(loc, isVisible) {
        browser.execute(isVisible ? 'flutter:waitFor' : 'flutter:waitForAbsent', loc, 10);
    },

    // TODO: Check method for element enabled or not
    isEnabledElement(loc, isEnabled) {
        browser.execute(isEnabled ? 'flutter:waitFor' : 'flutter:waitForAbsent', loc, 10);
    },

    getText(loc) {
        if (this.isVisibleElement(loc)) {
            return browser.getElementText(loc);
        } else {
            throw new Error(`Element ${loc} not visible.`);
        }
    },

    clickDeviceBackButton() {
        browser.switchContext('NATIVE_APP');
        if (browser.isAndroid) {
            browser.pressKeyCode(4);
        }
        browser.switchContext('FLUTTER');
    },

    relaunchApp() {
        browser.switchContext('NATIVE_APP');
        browser.reset();
        browser.switchContext('FLUTTER');
    },

    scrollUntilVisible(listView, loc, direction) {
        switch (direction) {
            case 'down':
                browser.execute('flutter:scrollUntilVisible', listView, {
                    item: loc,
                    dxScroll: 90,
                    dyScroll: -400,
                    duration: 3000,
                    frequency: 5
                });
                break;

            case 'up':
                browser.execute('flutter:scrollUntilVisible', listView, {
                    item: loc,
                    dxScroll: 90,
                    dyScroll: 400,
                    duration: 3000,
                    frequency: 5
                });
                break;

            case 'left':
                browser.execute('flutter:scrollUntilVisible', listView, {
                    item: loc,
                    dxScroll: -90,
                    dyScroll: 400,
                    duration: 3000,
                    frequency: 5
                });
                break;

            case 'right':
                browser.execute('flutter:scrollUntilVisible', listView, {
                    item: loc,
                    dxScroll: 90,
                    dyScroll: 400,
                    duration: 3000,
                    frequency: 5
                });
                break;

            default:
                throw new Error(`Direction ${direction} not found.`);
        }
    }
}
