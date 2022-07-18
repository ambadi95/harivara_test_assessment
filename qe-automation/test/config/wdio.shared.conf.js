const path = require('path');
const argv = require('yargs').argv;
const defaultTimeoutInterval = process.env.DEBUG ? (60 * 60 * 500) : 90000;

// Tags configuration
const defaultTags = 'not @pending and not @manual and not @wip';
const platformTags = argv.platform === 'android' ? ' and not @ios' : ' and not @android';
const appTags = argv.app === 'customer' ? ' and not @merchant' : ' and not @customer';
const tagsList = argv.tags ?
    argv.tags.split(',').join(' and ').concat(' and ', defaultTags, platformTags, appTags) :
    defaultTags.concat(platformTags, appTags);

// Global Variables configuration
global.platform = argv.platform ? argv.platform : 'android';
global.app = argv.app ? argv.app : 'customer';
global.language = argv.language ? argv.language : 'EN';
global.tags = tagsList.split(' and ');

exports.config = {
    runner: 'local',
    specs: ['./test/features/**/*.feature',],
    exclude: [],
    maxInstances: 15,
    logLevel: 'debug',
    outputDir: path.resolve(__dirname, '../../logs'),
    bail: 0,
    waitforTimeout: 20000,
    connectionRetryTimeout: 180000,
    connectionRetryCount: 1,
    framework: 'cucumber',

    reporters: [
        'spec',
        ['allure', {
            outputDir: './test/reports/allure-results',
            disableWebdriverStepsReporting: true,
            disableWebdriverScreenshotsReporting: true,
            useCucumberStepReporter: true,
            addConsoleLogs: true
        }],
        ['json', {
            outputDir: './test/reports/json-results'
        }],
        ['junit', {
            outputDir: './test/reports/junit-results',
            outputFileFormat: function (options) {
                return `results-${options.cid}.${options.capabilities}.xml`
            }
        }],

    ],

    cucumberOpts: {
        requireModule: ['@babel/register'],
        require: ['./test/stepDefinitions/*.steps.js', './test/pageObjects/*.page.js', "./test/utilities/*.js"],   // <string[]> (file/dir) require files before executing features
        backtrace: true,    // <boolean> show full backtrace for errors
        compiler: [], // <string[]> filetype:compiler used for processing required features
        failAmbiguousDefinitions: true,       // <boolean< Treat ambiguous definitions as errors
        dryRun: false,      // <boolean> invoke formatters without executing steps
        failFast: false,    // <boolean> abort the run on first failure
        ignoreUndefinedDefinitions: false,    // <boolean> Enable this config to treat undefined definitions as warnings
        name: [],           // <string[]> ("extension:module") require files with the given EXTENSION after requiring MODULE (repeatable)
        format: ['pretty'], // <string[]> (type[:path]) specify the output format, optionally supply PATH to redirect formatter output (repeatable)
        colors: true,       // <boolean> disable colors in formatter output
        snippets: false,    // <boolean> hide step definition snippets for pending steps
        source: false,      // <boolean> hide source uris
        profile: [],        // <string[]> (name) specify the profile to use
        strict: true,       // <boolean> fail if there are any undefined or pending steps
        tagExpression: tagsList,      // <string> (expression) only execute the features or scenarios with tags matching the expression, see https://docs.cucumber.io/tag-expressions/
        timeout: defaultTimeoutInterval,    // <number> timeout for step definitions
        tagsInTitle: false,                 // <boolean> add cucumber tags to feature or scenario name
        snippetSyntax: undefined,           // <string> specify a custom snippet syntax
    },

    before: function () {
        const chai = require('chai');
        global.expect = chai.expect;
        global.assert = chai.assert;
        global.should = chai.should();
        global.testData = '';
        browser.switchContext('FLUTTER');
    },

    beforeScenario: function () {
        browser.reset();
    }
};
