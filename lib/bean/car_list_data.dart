import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/bean/car_data.dart';
part 'car_list_data.g.dart';
@JsonSerializable()
class CarListData {
  final List<CarData> data;

  factory CarListData.fromJson(Map<String, dynamic> json) =>
      _$CarListDataFromJson(json);

  CarListData(this.data);



  Map<String, dynamic> toJson() => _$CarListDataToJson(this);
}