import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const builds = [
  'development',
  'production',
];

class EnvironmentKeys {
  static const analyticsApiTokenKeyName = 'ANALYTICS_API_TOKEN';
  static const analyticsProjectTokenKeyName = 'ANALYTICS_PROJECT_TOKEN';
  static const googlePlayAppIdKeyName = 'GOOGLE_PLAY_APP_ID';
  static const appStoreAppIdKeyName = 'APP_STORE_APP_ID';
  static const wiseScheme = 'WISE_SCHEME';
  static const wiseHost = 'WISE_HOST';
  static const wisePath = 'WISE_PATH';
  static const wiseClientId = 'WISE_CLIENT_ID';
  static const wiseRedirectUri = 'WISE_REDIRECT_URI';
  static const userSessionDuration = 'USER_SESSION_DURATION';
}

class EnvironmentResolver {
  bool isBuildRelease() => getBuild() == 'production';

  Future<Map<String, String>> loadEnvironment(String environment) async {
    final environmentFilePath = 'assets/environment/.env.$environment';
    final overrideEnvFileValid = await _envFileValid(environmentFilePath);

    if (!overrideEnvFileValid) {
      throw _invalidEnvironmentFile(environmentFilePath);
    }

    if (dotenv.isInitialized && dotenv.env.isNotEmpty) return {};

    // Load the env file based on the environment (eg .env.develop)
    await dotenv.load(fileName: environmentFilePath);
    final environmentEnv = {...dotenv.env};
    dotenv.env.addAll(environmentEnv);

    return dotenv.env;
  }

  String getBuild() {
    const build = String.fromEnvironment('NEOBANK_BUILD', defaultValue: '');

    if (!builds.contains(build.toLowerCase())) {
      throw Exception(
          "Unknown NEOBANK_BUILD '$build', please choose one of ${builds.join(', ')}");
    }

    return build;
  }

  String getEnvironmentVariable(
    String envName, {
    String defaultValue = '',
    bool isRequired = true,
  }) {
    final value = dotenv.env[envName];

    if (isRequired && value == null) {
      throw Exception(
        "Expected required environment variable '$envName' but got 'null'.",
      );
    }

    return value ?? defaultValue;
  }

  Future<bool> _envFileValid(String path) async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      final str = await rootBundle.loadString(path);

      return str.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Exception _invalidEnvironmentFile(String path) {
    return Exception('Failed to load in .env file. '
        "Please ensure that you have a properly configured environment file located at '$path' "
        "and that it's been added to the pubspec.yaml");
  }
}

typedef OnEnvironmentSelected = Function(String);

enum CrayonPaymentEnvironments {
  dev,
  qa,
  preprod,
  production,
  mock,
}

extension CrayonPaymentEnvExtension on CrayonPaymentEnvironments {
  String get name => toString().split('.').last;
}
