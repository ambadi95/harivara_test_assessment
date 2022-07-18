import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_screen.freezed.dart';

@freezed
class SourceScreen with _$SourceScreen {
  const SourceScreen._();

  String get path {
    return when(
      customerHome: () => 'homeModule/home',
      merchantHome: () => 'merchantQrModule/merchantHomeScreen',
      payment: () => 'paymentModule/paymentView',
      settings: () => 'settingModule/setting',
    );
  }

  const factory SourceScreen.customerHome() = CustomerHomeScreen;

  const factory SourceScreen.merchantHome() = MerchantHomeScreen;

  const factory SourceScreen.payment() = PaymentScreen;

  const factory SourceScreen.settings() = SettingsScreen;

  @override
  String toString() {
    return path;
  }
}
