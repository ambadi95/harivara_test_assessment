import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_type.freezed.dart';

@freezed
class AppType with _$AppType {
  const AppType._();

  factory AppType.fromString(String appName) {
    switch (appName.toLowerCase()) {
      case 'CrayonPayment business':
        return AppType.merchant();
      case 'CrayonPayment pay':
        return AppType.customer();
      default:
        throw UnimplementedError('$appName not supported');
    }
  }

  const factory AppType.merchant() = MerchantApp;

  const factory AppType.customer() = CustomerApp;

  @override
  String toString() {
    return when(
      merchant: () => 'MERCHANT',
      customer: () => 'CUSTOMER',
    );
  }
}
