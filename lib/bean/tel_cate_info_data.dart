import 'package:json_annotation/json_annotation.dart';

part 'tel_cate_info_data.g.dart';

@JsonSerializable()
class  TelCateInfoData {
  final List<InnerTelCateInfoData> data;

  factory  TelCateInfoData.fromJson(Map<String, dynamic> json) =>
      _$TelCateInfoDataFromJson(json);

   TelCateInfoData(this.data);

  Map<String, dynamic> toJson() => _$TelCateInfoDataToJson(this);

}


@JsonSerializable()
class InnerTelCateInfoData {
  final int id;
  final String name;
  final String phone;
  factory InnerTelCateInfoData.fromJson(Map<String, dynamic> json) =>
      _$InnerTelCateInfoDataFromJson(json);

  InnerTelCateInfoData(this.id, this.name, this.phone);

  Map<String, dynamic> toJson() => _$InnerTelCateInfoDataToJson(this);
}