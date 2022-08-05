const {config} = require('./wdio.shared.conf');
const appPackage = global.app === 'customer' ? 'com.y9.customer' : 'com.CrayonPaymentpay.merchant';

exports.config = {
    ...config,
    ...{
        services: [['appium', {
            args: {
                host: '192.168.31.44',
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
