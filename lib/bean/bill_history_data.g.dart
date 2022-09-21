// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillHistoryData _$BillHistoryDataFromJson(Map<String, dynamic> json) =>
    BillHistoryData(
      (json['list'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['amount'] as String,
      json['count'] as int,
    );

Map<String, dynamic> _$BillHistoryDataToJson(BillHistoryData instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'count': instance.count,
      'list': instance.list,
    };
