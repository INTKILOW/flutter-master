import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'action_data.dart';
part 'repair_types_data.g.dart';

@JsonSerializable()
class RepairTypesData {
  final List<InnerRepairTypesData> data;

  factory RepairTypesData.fromJson(Map<String, dynamic> json) =>
      _$RepairTypesDataFromJson(json);

  RepairTypesData(this.data);
  Map<String, dynamic> toJson() => _$RepairTypesDataToJson(this);
}


@JsonSerializable()
class InnerRepairTypesData {
  final String icon;
  final String name;
  final int id;
  final String selectIcon;
  factory InnerRepairTypesData.fromJson(Map<String, dynamic> json) =>
      _$InnerRepairTypesDataFromJson(json);

  InnerRepairTypesData(this.icon, this.name, this.id, this.selectIcon);




  Map<String, dynamic> toJson() => _$InnerRepairTypesDataToJson(this);
}