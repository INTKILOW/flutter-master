// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_points_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPointsData _$UserPointsDataFromJson(Map<String, dynamic> json) =>
    UserPointsData(
      json['points'] as int,
      json['sign'] as bool,
      json['signPoints'] as int?,
    );

Map<String, dynamic> _$UserPointsDataToJson(UserPointsData instance) =>
    <String, dynamic>{
      'points': instance.points,
      'sign': instance.sign,
      'signPoints': instance.signPoints,
    };
