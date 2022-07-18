import 'package:core/retrievers/data_models/app_info.dart';

String getWalletId(String? accessToken, AppInfo appInfo) {
  String walletId = appInfo.appType.when(
    merchant: () => '511',
    customer: () => accessToken!.endsWith('t8k')
        ? '999'
        : accessToken.endsWith('_zg')
            ? '321'
            : '100',
  );

  return walletId;
}
