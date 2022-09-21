import 'package:json_annotation/json_annotation.dart';
part 'action_data.g.dart';
@JsonSerializable()
class ActionData {
  final String path;
  final String? params;

  factory ActionData.fromJson(Map<String, dynamic> json) =>
      _$ActionDataFromJson(json);

  ActionData(this.path, this.params);

 
  Map<String, dynamic> toJson() => _$ActionDataToJson(this);
}