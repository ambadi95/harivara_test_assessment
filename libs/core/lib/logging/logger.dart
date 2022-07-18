import 'package:core/environment/environment_resolver.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/storage/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'logger_level.dart';

class CrayonPaymentLogger {
  static const _appName = 'CrayonPayment';
  static final Logger _logger = Logger(output: CrayonPaymentConsoleOutput());
  static var logs = <String>[];
  static String? environment;

  void setLogLevels(
    LoggerLevel loggerLevel,
  ) {
    switch (loggerLevel) {
      case LoggerLevel.DEBUG:
        Logger.level = Level.debug;
        break;

      case LoggerLevel.ERROR:
        Logger.level = Level.error;
        break;

      case LoggerLevel.WARN:
        Logger.level = Level.warning;
        break;

      case LoggerLevel.INFO:
        Logger.level = Level.verbose;
        break;

      default:
        Logger.level = Level.nothing;
    }
  }

  /// Logs a the [msg] to the device's console if the device is compiled in
  /// debug mode.
  ///
  /// The primary level of logging. Most logging statements should be
  /// debug messages to trace the flow of the program in debug mode but also
  /// to prevent anyone who has a release build of the application from learning
  /// too much about the flow and logic of the application.
  static void logDebug<T>(String msg) {
    print(msg);
    final detailedMessage =
        _getDetailedMessage(msg, LoggerLevel.DEBUG, T.toString());
    _logMessage(detailedMessage);
  }

  /// Logs the [msg] to the device's console.
  ///
  /// The informative logging method should be used sparingly for major changes
  /// in the flow of the program to provide some context on how the user is using
  /// the application
  static void logInfo<T>(String msg) {
    final detailedMessage =
        _getDetailedMessage(msg, LoggerLevel.INFO, T.toString());
    _logMessage(detailedMessage);
  }

  /// Logs the [msg] to the device's console.
  ///
  /// The warning logging method should be used only when the developer wants
  /// to log a warning to the console.
  static void logWarning<T>(String msg) {
    final detailedMessage =
        _getDetailedMessage(msg, LoggerLevel.WARN, T.toString());
    _logMessage(detailedMessage);
  }

  /// Logs the [msg] to the device's console.
  ///
  /// The error logging method should be used only when the developer wants
  /// to log an error to the console.
  /// todo: debate on sending error remotely also.
  static void logError<T>(String msg) {
    final detailedMessage =
        _getDetailedMessage(msg, LoggerLevel.ERROR, T.toString());
    _logMessage(detailedMessage);
  }

  // generic logging method
  static String _getDetailedMessage(
    String msg,
    LoggerLevel level,
    String classType,
  ) {
    final dateTime = DateTime.now();
    final levelString = level.toString().split('.').last;
    final formattedTime =
        '${dateTime.hour.toString()}:${dateTime.minute.toString()}:${dateTime.second.toString()}';
    final contents =
        '[$_appName] [$formattedTime] [$classType] [$levelString] - $msg';
    return contents;
  }

  static void _logMessage(String msg) async {
    if (msg.isEmpty) {
      return;
    }

    try {
      // try/catch forUnitTest
      if (environment == null) {
        var _storageService = DIContainer.container.resolve<IStorageService>();
        environment = await _storageService.getValueFromMemory('environment');
      }

      if (environment != CrayonPaymentEnvironments.production.name) {
        if (!kReleaseMode) {
          _logger.e(msg);
        } else {
          logs.add(msg);
        }
      }
    } catch (e) {
      // ignore: todo
      //TODO: Implement error handling.
      print(e);
    }
  }
}

class CrayonPaymentConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    // ignore: todo
    // TODO: implement output
    CrayonPaymentLogger.logs.addAll(event.lines);
    event.lines.forEach((element) {
      print(element);
    });
  }
}
