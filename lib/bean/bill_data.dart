import 'package:json_annotation/json_annotation.dart';

part 'bill_data.g.dart';

@JsonSerializable()
class BillData {
  final String amount;
  String discountAmount;
  String totalAmount;
  final List<BillItem> list;

  factory BillData.fromJson(Map<String, dynamic> json) =>
      _$BillDataFromJson(json);

  BillData(this.amount, this.discountAmount, this.list, this.totalAmount);

  Map<String, dynamic> toJson() => _$BillDataToJson(this);
}

@JsonSerializable()
class BillItem {
  final int? id;
  final String? date;
  final String? beginDate;
  final String? endDate;
  final String? name;
  final String amount;
  final String discountAmount;
  final String? totalAmount;
  final List<BillItem>? list;
  bool? expand;
  bool forceCheck;
  bool check;

  factory BillItem.fromJson(Map<String, dynamic> json) =>
      _$BillItemFromJson(json);

  BillItem(
      this.id,
      this.date,
      this.name,
      this.amount,
      this.discountAmount,
      this.list,
      this.beginDate,
      this.endDate,
      this.totalAmount,
      this.expand,
      this.forceCheck,
      this.check);

  Map<String, dynamic> toJson() => _$BillItemToJson(this);
}
