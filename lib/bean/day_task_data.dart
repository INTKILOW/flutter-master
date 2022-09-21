import 'package:json_annotation/json_annotation.dart';
part 'day_task_data.g.dart';
@JsonSerializable()
class DayTaskData {
  final String taskDate;
  final String taskName;
  final String taskTypeName;

  final int taskId;
  final int dateId;



  final String deviceName;
  final String devicePosition;
  final String communityName;

  final int deviceId;
  final String taskType;
  final String deviceCode;
  factory DayTaskData.fromJson(Map<String, dynamic> json) =>
      _$DayTaskDataFromJson(json);

  DayTaskData(this.taskDate, this.taskName, this.taskTypeName, this.taskId, this.dateId, this.deviceName, this.devicePosition, this.communityName, this.deviceId, this.taskType, this.deviceCode);

  Map<String, dynamic> toJson() => _$DayTaskDataToJson(this);
}