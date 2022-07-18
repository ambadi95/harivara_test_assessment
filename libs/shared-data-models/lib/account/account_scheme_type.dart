import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_scheme_type.freezed.dart';

@freezed
class AccountSchemeType with _$AccountSchemeType {
  const AccountSchemeType._();

  factory AccountSchemeType.fromString(String rawString) {
    switch (rawString.toLowerCase()) {
      case 'wallet':
        return AccountSchemeType.wallet();
      case 'iban':
        return AccountSchemeType.iban();
      default:
        throw UnimplementedError('$rawString not supported');
    }
  }

  const factory AccountSchemeType.wallet() = WALLET;

  const factory AccountSchemeType.iban() = IBAN;

  @override
  String toString() {
    return maybeWhen(
      wallet: () => 'WALLET',
      iban: () => 'IBAN',
      orElse: () => 'unknown',
    );
  }
}
