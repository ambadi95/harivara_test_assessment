const {config} = require('./wdio.shared.conf');
const compatibilityDeviceList = require('./wdio.browserstack.compatibility.conf.json');
const smokeDeviceList = require('./wdio.browserstack.smoke.conf.json');

exports.config = {
    ...config,
    ...{
        user: process.env.BROWSERSTACK_USER,
        key: process.env.BROWSERSTACK_KEY,
        services: ['browserstack'],
        capabilities: getAllDeviceCaps()
    },

    afterScenario(result) {
        result['result']['status'] === 'PASSED' ?
            browser.executeScript(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed","reason": "Passed"}}`) :
            browser.executeScript(`browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": ${result['result']['message']}}`);
    }
}

function getAllDeviceCaps() {
    const defaultCaps = {
        'browserstack.gpsLocation': '25.276987, 55.296249',
        'browserstack.networkLogs': true,
        automationName: 'Flutter',
        acceptSslCerts: true,
        autoGrantPermissions: true,
        newCommandTimeout: 90000,
        sessionOverride: true,
        platformName: global.platform,
        app: process.env.BROWSERSTACK_APP_URL || 'bs://11b777abdf1cf06c52e22f21510344df875bf238'
    };

    const devicesList = global.tags.includes('@e2e') ? smokeDeviceList[global.platform] : compatibilityDeviceList[global.platform];
    return devicesList.map(caps => Object.assign(caps, defaultCaps));
}
