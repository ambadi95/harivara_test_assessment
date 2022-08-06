const {config} = require('./wdio.shared.conf');
const appPackage = global.app === 'customer' ? 'com.CrayonPaymentpay.customer' : 'com.CrayonPaymentpay.merchant';

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
                autoGrantPermissions: true
            }
        }]],

        capabilities: [
            {
                automationName: 'Flutter',
                platformName: 'iOS',
                platformVersion: '14.4',
                udid: '696BD4BF-5A64-4516-9868-45D16AFF4813',
                deviceName: 'iPhone 12 Pro Max',
                bundleId: appPackage,
                autoGrantPermissions: true,
                newCommandTimeout: 90000,
                sessionOverride: true
            }
        ]
    }
};
