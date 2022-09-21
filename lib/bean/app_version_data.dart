import 'package:json_annotation/json_annotation.dart';
part 'app_version_data.g.dart';
@JsonSerializable()
class AppVersionData {
  final String androidUrl;
  final String iosUrl;
  final String content;
  final String versionCode;
  final bool needUpgrade;
  final int force;

  factory AppVersionData.fromJson(Map<String, dynamic> json) =>
      _$AppVersionDataFromJson(json);

  AppVersionData(this.androidUrl, this.iosUrl, this.content, this.versionCode, this.force, this.needUpgrade);


 
  Map<String, dynamic> toJson() => _$AppVersionDataToJson(this);
}