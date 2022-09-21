import 'package:json_annotation/json_annotation.dart';
part 'house_detail_data.g.dart';
@JsonSerializable()
class HouseDetailData {
  final int id;
  final String communityName;
  final String fullName;
  final String houseType;
  final String propertyRight;
  final String buildArea;
  final bool isHost;

  final List<InnerHouseDetail> list;


  factory HouseDetailData.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailDataFromJson(json);

  HouseDetailData(this.id, this.communityName, this.fullName, this.houseType, this.propertyRight, this.buildArea, this.list, this.isHost);


  Map<String, dynamic> toJson() => _$HouseDetailDataToJson(this);
}
@JsonSerializable()
class InnerHouseDetail{

  final int id;
  final String avatar;
  final int bindType;
  final String bindTypeName;
  final String userName;
  final String phone;
  factory InnerHouseDetail.fromJson(Map<String, dynamic> json) =>
      _$InnerHouseDetailFromJson(json);

  InnerHouseDetail(this.id, this.avatar, this.bindType, this.bindTypeName, this.userName, this.phone);


  Map<String, dynamic> toJson() => _$InnerHouseDetailToJson(this);

}