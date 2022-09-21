import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'repair_data.g.dart';
@JsonSerializable()
class RepairData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerRepairData> list;

  RepairData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory RepairData.fromJson(Map<String, dynamic> json) =>
      _$RepairDataFromJson(json);
  Map<String, dynamic> toJson() => _$RepairDataToJson(this);
}



@JsonSerializable()
class InnerRepairData {
  final int id;

  factory InnerRepairData.fromJson(Map<String, dynamic> json) =>
      _$InnerRepairDataFromJson(json);

  InnerRepairData(this.id);



  Map<String, dynamic> toJson() => _$InnerRepairDataToJson(this);
}