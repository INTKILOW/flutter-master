import 'package:json_annotation/json_annotation.dart';

part 'workflow_people_data.g.dart';

@JsonSerializable()
class WorkflowPeopleData {
  final List<InnerWorkflowPeopleData> children;

  factory WorkflowPeopleData.fromJson(Map<String, dynamic> json) =>
      _$WorkflowPeopleDataFromJson(json);

  WorkflowPeopleData(this.children);

  Map<String, dynamic> toJson() => _$WorkflowPeopleDataToJson(this);
}

@JsonSerializable()
class InnerWorkflowPeopleData {
  final int id;

  final String name;
  final String? phone;
  bool? expand;
  final int? postTypeId;
  final List<InnerWorkflowPeopleData>? children;

  factory InnerWorkflowPeopleData.fromJson(Map<String, dynamic> json) =>
      _$InnerWorkflowPeopleDataFromJson(json);

  InnerWorkflowPeopleData(this.id, this.name, this.phone, this.children,
      this.expand, this.postTypeId);

  Map<String, dynamic> toJson() => _$InnerWorkflowPeopleDataToJson(this);
}
