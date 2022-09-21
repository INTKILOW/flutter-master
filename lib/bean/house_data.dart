import 'package:json_annotation/json_annotation.dart';
part 'house_data.g.dart';
@JsonSerializable()
class HouseData {
  final double? actualArea;
  final String fullName;
    String communityName;
  final int communityId;
  final int id;
  // 1业主 2租户
  final int bindType;
  final int userNum;

  HouseData(this.actualArea, this.fullName, this.communityName, this.communityId, this.id, this.bindType, this.userNum);
  factory HouseData.fromJson(Map<String, dynamic> json) =>
      _$HouseDataFromJson(json);



  Map<String, dynamic> toJson() => _$HouseDataToJson(this);
}