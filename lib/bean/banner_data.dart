import 'package:json_annotation/json_annotation.dart';

import 'action_data.dart';
part 'banner_data.g.dart';
@JsonSerializable()
class BannerData {
  final String url;
  final ActionData? action;

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);

  BannerData(this.url, this.action);

 
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}