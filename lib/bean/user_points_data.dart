import 'package:json_annotation/json_annotation.dart';
part 'user_points_data.g.dart';
@JsonSerializable()
class UserPointsData {

  final int points;
  final bool sign;
  final int? signPoints;

  factory UserPointsData.fromJson(Map<String, dynamic> json) =>
      _$UserPointsDataFromJson(json);

  UserPointsData(this.points, this.sign, this.signPoints);



 
  Map<String, dynamic> toJson() => _$UserPointsDataToJson(this);
}