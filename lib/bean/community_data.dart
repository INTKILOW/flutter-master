import 'package:json_annotation/json_annotation.dart';
part 'community_data.g.dart';
@JsonSerializable()
class CommunityData {

  final List<InnerCommunityData> data;

  factory CommunityData.fromJson(Map<String, dynamic> json) =>
      _$CommunityDataFromJson(json);

  CommunityData(this.data);
  Map<String, dynamic> toJson() => _$CommunityDataToJson(this);
}



@JsonSerializable()
class InnerCommunityData {
  final int id;
  final String address;
  final String name;

  factory InnerCommunityData.fromJson(Map<String, dynamic> json) =>
      _$InnerCommunityDataFromJson(json);

  InnerCommunityData(this.id, this.address, this.name);

  Map<String, dynamic> toJson() => _$InnerCommunityDataToJson(this);
}