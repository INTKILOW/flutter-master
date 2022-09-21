// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillData _$BillDataFromJson(Map<String, dynamic> json) => BillData(
      json['amount'] as String,
      json['discountAmount'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalAmount'] as String,
    );

Map<String, dynamic> _$BillDataToJson(BillData instance) => <String, dynamic>{
      'amount': instance.amount,
      'discountAmount': instance.discountAmount,
      'totalAmount': instance.totalAmount,
      'list': instance.list,
    };

BillItem _$BillItemFromJson(Map<String, dynamic> json) => BillItem(
      json['id'] as int?,
      json['date'] as String?,
      json['name'] as String?,
      json['amount'] as String,
      json['discountAmount'] as String,
      (json['list'] as List<dynamic>?)
          ?.map((e) => BillItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['beginDate'] as String?,
      json['endDate'] as String?,
      json['totalAmount'] as String?,
      json['expand'] as bool?,
      json['forceCheck'] as bool,
      json['check'] as bool,
    );

Map<String, dynamic> _$BillItemToJson(BillItem instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'name': instance.name,
      'amount': instance.amount,
      'discountAmount': instance.discountAmount,
      'totalAmount': instance.totalAmount,
      'list': instance.list,
      'expand': instance.expand,
      'forceCheck': instance.forceCheck,
      'check': instance.check,
    };
