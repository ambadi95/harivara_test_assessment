class RequiredHeaders {
  static final String HEADER_DEVICE_ALIAS =
      'Alias-Name'; // PHONE Brand as provided
  static final String HEADER_APP_NAME =
      'App-Name'; // Which App it is CUS/MERCHANT

  static final String HEADER_APP_VERSION = 'App-Version'; // Version of App
  static final String HEADER_PLATFORM = 'Platform'; // iOS/Android

  static final String HEADER_CLIENT_IP = 'X-Forwarded-For';
  static final String HEADER_USER_AGENT = 'User-Agent';

  static final String HEADER_CONTENT_TYPE = 'Content-Type';

  static final String HEADER_X_CrayonPayment_CHANNEL =
      'x-CrayonPayment-channel';

  final String deviceAlias;
  final String appName;
  final String appVersion;
  final String platform;
  final String clientIp;
  final String userAgent;

  RequiredHeaders({
    required this.deviceAlias,
    required this.appName,
    required this.appVersion,
    required this.platform,
    required this.clientIp,
    required this.userAgent,
  });

  Map<String, String> toJson() => {
        HEADER_DEVICE_ALIAS: deviceAlias,
        HEADER_APP_NAME: appName,
        HEADER_APP_VERSION: appVersion,
        HEADER_PLATFORM: platform,
        HEADER_CLIENT_IP: clientIp,
        HEADER_USER_AGENT: userAgent,
        HEADER_X_CrayonPayment_CHANNEL: 'MOBILE',
      };
}
