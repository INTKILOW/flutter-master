import 'package:json_annotation/json_annotation.dart';
part 'pay_info_data.g.dart';
@JsonSerializable()
class PayInfoData {
  final String description;
  final String payAmount;
  final List<PayInfoTypeListData> payList;

  factory PayInfoData.fromJson(Map<String, dynamic> json) =>
      _$PayInfoDataFromJson(json);

  PayInfoData(this.description, this.payAmount, this.payList);
  Map<String, dynamic> toJson() => _$PayInfoDataToJson(this);
}

@JsonSerializable()
class PayInfoTypeListData {
  final int type;
  final int id;

  factory PayInfoTypeListData.fromJson(Map<String, dynamic> json) =>
      _$PayInfoTypeListDataFromJson(json);

  PayInfoTypeListData(this.type, this.id);

  Map<String, dynamic> toJson() => _$PayInfoTypeListDataToJson(this);

}


 