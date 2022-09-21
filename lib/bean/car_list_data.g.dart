// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarListData _$CarListDataFromJson(Map<String, dynamic> json) => CarListData(
      (json['data'] as List<dynamic>)
          .map((e) => CarData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarListDataToJson(CarListData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
