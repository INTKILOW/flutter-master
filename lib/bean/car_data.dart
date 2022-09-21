import 'package:json_annotation/json_annotation.dart';
part 'car_data.g.dart';
@JsonSerializable()
class CarData {
  final int id;
  final String plate;
  final String brand;
  final String color;
  final int type;


  factory CarData.fromJson(Map<String, dynamic> json) =>
      _$CarDataFromJson(json);

  CarData(this.id, this.plate, this.brand, this.color, this.type);


  Map<String, dynamic> toJson() => _$CarDataToJson(this);
}