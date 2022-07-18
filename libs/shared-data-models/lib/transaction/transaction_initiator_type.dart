import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_initiator_type.freezed.dart';

@freezed
class TransactionInitiatorType with _$TransactionInitiatorType {
  const TransactionInitiatorType._();

  const factory TransactionInitiatorType.receiver() = Receiver;

  const factory TransactionInitiatorType.sender() = Sender;

  const factory TransactionInitiatorType.notAvailable() =
      TransactionInitiatorNA;

  factory TransactionInitiatorType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'receiver':
        return TransactionInitiatorType.receiver();
      case 'sender':
        return TransactionInitiatorType.sender();
      case 'n/a':
        return TransactionInitiatorType.notAvailable();
      default:
        throw UnimplementedError(
          '$rawString not a supported TransactionInitiatorType',
        );
    }
  }

  @override
  String toString() {
    return when(
      receiver: () => 'RECEIVER',
      sender: () => 'SENDER',
      notAvailable: () => 'N/A',
    );
  }
}
