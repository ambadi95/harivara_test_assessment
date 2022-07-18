module.exports = function (grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        webdriver: {
            'test-browserstack': {
                configFile: './test/config/wdio.browserstack.shared.conf.js'
            },
            'test-browserstack-smoke': {
                configFile: './test/config/wdio.browserstack.shared.conf.js'
            }
        },
    });

    grunt.loadNpmTasks('grunt-cucumberjs');
    grunt.loadNpmTasks('grunt-webdriver');
    grunt.registerTask('default', ['webdriver:test-mobile']);
};
