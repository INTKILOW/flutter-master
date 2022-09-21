import 'package:json_annotation/json_annotation.dart';

part 'tel_cate_data.g.dart';

@JsonSerializable()
class  TelCateData {
  final List<InnerTelCateData> data;

  factory  TelCateData.fromJson(Map<String, dynamic> json) =>
      _$TelCateDataFromJson(json);

   TelCateData(this.data);

  Map<String, dynamic> toJson() => _$TelCateDataToJson(this);

}


@JsonSerializable()
class InnerTelCateData {
  final int id;
  final String name;
  factory InnerTelCateData.fromJson(Map<String, dynamic> json) =>
      _$InnerTelCateDataFromJson(json);

  InnerTelCateData(this.id, this.name);

  Map<String, dynamic> toJson() => _$InnerTelCateDataToJson(this);
}