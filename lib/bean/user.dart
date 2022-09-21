import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/bean/car_data.dart';
import 'package:flutter_master/bean/house_data.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String avatar;

  /// 性别（2 其他 1男 0女）
  int gender;
  final bool isWorker;
  String name;
  final String phone;
  final String token;
  int? points;
  int unReadNum;

  final List<String> roleList;
  final List<String>? pushTags;
  final List<HouseData> houseList;

  User(this.avatar, this.gender, this.isWorker, this.name, this.phone,
      this.token, this.roleList, this.houseList, this.points, this.unReadNum, this.pushTags);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
