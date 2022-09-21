import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'media_data.dart';
part 'repair_detail_data.g.dart';
@JsonSerializable()
class RepairDetailData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerRepairDetailData> list;

  RepairDetailData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory RepairDetailData.fromJson(Map<String, dynamic> json) =>
      _$RepairDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$RepairDetailDataToJson(this);
}



@JsonSerializable()
class InnerRepairDetailData {
  final int id;
  final String content;
  final String communityName;
  final String createTime;
  final String expectedTime;
  final String houseName;

  final bool inWarranty;
  final List<MediaData>? mediaList;

  final int nodeId;
  final int origin;
  final int overHour;
  final String nodeName;
  final String orderNo;
  final String phone;
  final String userName;
  final String positionName;
  final String action;
  final bool isEvaluate;
  final List<InnerProcessData>? processList;
  factory InnerRepairDetailData.fromJson(Map<String, dynamic> json) =>
      _$InnerRepairDetailDataFromJson(json);

  InnerRepairDetailData(this.id, this.content, this.communityName, this.createTime, this.expectedTime, this.houseName, this.inWarranty, this.mediaList, this.nodeId, this.origin, this.overHour, this.nodeName, this.orderNo, this.phone, this.userName, this.positionName, this.processList, this.action, this.isEvaluate);



  Map<String, dynamic> toJson() => _$InnerRepairDetailDataToJson(this);
}

@JsonSerializable()
class InnerProcessData {
  final String content;
  final String createTime;
  final String remark;
  final String title;
  final String userName;
  final int id;
  final List<MediaData>? mediaList;
  final int score;


  factory InnerProcessData.fromJson(Map<String, dynamic> json) =>
      _$InnerProcessDataFromJson(json);

  InnerProcessData(this.content, this.createTime, this.remark, this.title, this.userName, this.id, this.mediaList, this.score);



  Map<String, dynamic> toJson() => _$InnerProcessDataToJson(this);
}
