import 'package:json_annotation/json_annotation.dart';

import 'bill_data.dart';
part 'bill_history_data.g.dart';
@JsonSerializable()
class BillHistoryData {

  final String amount;
  final int count;
  final List<BillItem> list;
  factory BillHistoryData.fromJson(Map<String, dynamic> json) =>
      _$BillHistoryDataFromJson(json);

  BillHistoryData(this.list, this.amount, this.count);


  Map<String, dynamic> toJson() => _$BillHistoryDataToJson(this);
}
 