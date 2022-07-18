import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_context_type.freezed.dart';

@freezed
class PaymentContextType with _$PaymentContextType {
  const PaymentContextType._();

  factory PaymentContextType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'm2m':
        return PaymentContextType.m2m();
      case 'p2m':
        return PaymentContextType.p2m();
      case 'p2p':
        return PaymentContextType.p2p();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory PaymentContextType.m2m() = M2M;

  const factory PaymentContextType.p2m() = P2M;

  const factory PaymentContextType.p2p() = P2P;

  @override
  String toString() {
    return maybeWhen(
      m2m: () => 'M2M',
      p2m: () => 'P2M',
      p2p: () => 'P2P',
      orElse: () => 'unknown',
    );
  }
}
