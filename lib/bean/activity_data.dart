import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'activity_data.g.dart';
@JsonSerializable()
class ActivityData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerActivityData> list;

  ActivityData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory ActivityData.fromJson(Map<String, dynamic> json) =>
      _$ActivityDataFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityDataToJson(this);
}



@JsonSerializable()
class InnerActivityData {
  final int id;
  final int communityId;
  final String address;
  final String name;
  final int number;
  final String thumbnail;
  final String timeRange;
  final int status;
  final String statusValue;

  final int? maxNumber;
  final int? pv;
  final int? like;
  final String? content;
  final List<String>? avatarList;
  final String? month;
  final String? day;
  final String? shareLink;

  factory InnerActivityData.fromJson(Map<String, dynamic> json) =>
      _$InnerActivityDataFromJson(json);

  InnerActivityData(this.id,this.address, this.name, this.number, this.thumbnail, this.timeRange, this.status, this.statusValue, this.maxNumber, this.pv, this.like, this.content, this.avatarList, this.month, this.day, this.communityId, this.shareLink);



  Map<String, dynamic> toJson() => _$InnerActivityDataToJson(this);
}