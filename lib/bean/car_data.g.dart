// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarData _$CarDataFromJson(Map<String, dynamic> json) => CarData(
      json['id'] as int,
      json['plate'] as String,
      json['brand'] as String,
      json['color'] as String,
      json['type'] as int,
    );

Map<String, dynamic> _$CarDataToJson(CarData instance) => <String, dynamic>{
      'id': instance.id,
      'plate': instance.plate,
      'brand': instance.brand,
      'color': instance.color,
      'type': instance.type,
    };
