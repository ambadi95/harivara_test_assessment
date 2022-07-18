const {config} = require('./wdio.shared.conf');
const appPackage = global.app === 'customer' ? 'com.CrayonPaymentpay.customer' : 'com.CrayonPaymentpay.merchant';

exports.config = {
    ...config,
    ...{
        services: [['appium', {
            args: {
                host: '127.0.0.1',
                port: 4723,
                'base-path': '/',
                'relaxed-security': true,
                'log-level': 'debug',
                'session-override': true,
            }
        }]],

        capabilities: [
            {
                platformName: 'Android',
                automationName: 'Flutter',
                platformVersion: '11.0',
                orientation: 'PORTRAIT',
                deviceName: 'emulator-5554',
                appPackage: appPackage,
                appActivity: 'MainActivity',
                autoGrantPermissions: true,
                newCommandTimeout: 90000,
                sessionOverride: true
            }
        ]
    }
};
