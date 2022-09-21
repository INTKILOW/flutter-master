import 'package:json_annotation/json_annotation.dart';
part 'media_data.g.dart';
@JsonSerializable()
class MediaData {
  final String url;


  factory MediaData.fromJson(Map<String, dynamic> json) =>
      _$MediaDataFromJson(json);

  MediaData(this.url);

  Map<String, dynamic> toJson() => _$MediaDataToJson(this);
}