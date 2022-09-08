import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? paymentId;
  final String? status;
  final String? amountPaid;

  const Data({this.paymentId, this.status, this.amountPaid});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? paymentId,
    String? status,
    String? amountPaid,
  }) {
    return Data(
      paymentId: paymentId ?? this.paymentId,
      status: status ?? this.status,
      amountPaid: amountPaid ?? this.amountPaid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [paymentId, status, amountPaid];
}
