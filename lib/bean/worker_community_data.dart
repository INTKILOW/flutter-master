import 'package:json_annotation/json_annotation.dart';

part 'worker_community_data.g.dart';

@JsonSerializable()
class  WorkCommunityData {
  final List<InnerWorkCommunityData> data;

  factory  WorkCommunityData.fromJson(Map<String, dynamic> json) =>
      _$WorkCommunityDataFromJson(json);

   WorkCommunityData(this.data);

  Map<String, dynamic> toJson() => _$WorkCommunityDataToJson(this);

}


@JsonSerializable()
class InnerWorkCommunityData {
  final int id;
  final String name;
  factory InnerWorkCommunityData.fromJson(Map<String, dynamic> json) =>
      _$InnerWorkCommunityDataFromJson(json);

  InnerWorkCommunityData(this.id, this.name);

  Map<String, dynamic> toJson() => _$InnerWorkCommunityDataToJson(this);
}