# DEV TOOLS SETUP:

- Access to Gitlab.

- Clone the Flutter Dev repo.

- Install Flutter SDK and setup the corresponding path.

- Install Android Studio + Install plugins ( Flutter + Dart).

- Install Android adb.

- Set ANDROID_HOME value in Environment variables.

- Open the project in Android Studio.

- Yarn install in the repo.

- Download and install Dart and Flutter SDK.

- Verify flutter doctor does not show any error. Please resolve errors, if any.

- Create a Virtual Device (AVD Manager for Android, Xcode simulators for iOS).

- Setup a new Configuration with Flutter app for both Customer and Merchant.

- Install all dependencies from pubspec.yaml files using Pub get.

- Run the configuration to install the app on the device and test out Flutter inspector (found in Flutter dev tools).

# QE AUTOMATION SETUP:

- Install Node.

- Install appium globally using ‘npm i -g appium’.

- Open the qe-automation folder in the dev repo using Webstorm/VS code IDE.
 
- Run npm install.

- Generate debug app from Android studio.

- Place the app in apps folder (use name ‘app-debug.apk’) OR update app path in appium config to point to the debug app 
generated from Android studio.
 
- Start local selenium server using the command ‘appium -a 127.0.0.1 -p 4723 -pa /‘.

- Execution should start.


# EXECUTION COMMANDS:

Flutter Build commands to build app from Android studio. Debug builds are needed to enable Automation execution.
 
 
    flutter build apk  --debug
    
    flutter build ios  --debug

    NOTE: You can use --release to build release apps.  

Start Local Appium Server using cmd line: 


    appium -a 127.0.0.1 -p 4723 -pa /
    
Execute commands for iOS and Android

npm run test-mobile-android -- --tags @test --app customer --language EN --platform android


    npm run test-mobile-android
    
    npm run test-mobile-ios
    
Execute commands for  Browserstack


    npm run test-browserstack
        This executes all the test scenarios on all the devices for both iOS and Android. 
    
    npm run test-browserstack --tags @e2e
        This executes only the E2E tagged test scenarios on 2 devices (1 iOS and 1 android) only.

# EXECUTION ARGUMENTS:

You can use any/combination of the following arguments along with execution commands.

Example:  
npm run test-mobile-android -- --tags @test --app customer --language EN --platform android


    --tags <value>
        No default value.
        Possible values: @e2e or any other preferred tag or tags(comma separated).
        
        To run specific files or scenarios with the specificed tagging.
        Not providing this argument runs all the scenarios in all the Feature files.
        For Browserstack Smoke execution, this tag is compulsory and only runs @e2e tagged scenarios on 
        2 devices (1 iOS and 1 android).
        For Browserstack Compatibility execution, this tag is not required and runs all the scenarios on all the 
        devices for iOS and Android.
        Check browserstack smoke and comptibility json files for device lists.
    
    --language <value>
        Default value: EN
        Possible values: EN or AR
        To run the automation with language as English or Arabic. 
        
    --platform <value>
        Default value: android
        Possible values: android or ios
        To run the automation on iOS or Android platforms.
        
    --app <value>
        Default value: customer
        Possible values: customer or merhant.
        To run the automation on specific apps for customer or merchant.

    NOTE: Please use double hypen (--) before specifying any tags since the first set of hypens (--) indicates to npm 
    that the arguments are being passed from now on.  
    So, first set of -- indicates the arguments are being passed now and --tags means tags is an argument and 
    is followed by its value.
