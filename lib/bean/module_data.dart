import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'action_data.dart';
part 'module_data.g.dart';

@JsonSerializable()
class ModuleData extends BaseRefreshBean{
  final List<InnerModuleData> data;

  factory ModuleData.fromJson(Map<String, dynamic> json) =>
      _$ModuleDataFromJson(json);

  ModuleData(this.data);



  Map<String, dynamic> toJson() => _$ModuleDataToJson(this);

  @override
  List? get dataList => data.isNotEmpty?[1]:[];

  @override
  bool get hasPage => false;
}


@JsonSerializable()
class InnerModuleData {
  final String icon;
  final String name;
  final String subtitle;
  final ActionData? action;

  factory InnerModuleData.fromJson(Map<String, dynamic> json) =>
      _$InnerModuleDataFromJson(json);

  InnerModuleData(this.icon, this.name, this.subtitle, this.action);



  Map<String, dynamic> toJson() => _$InnerModuleDataToJson(this);
}