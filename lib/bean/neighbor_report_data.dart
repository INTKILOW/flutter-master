import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'media_data.dart';
part 'neighbor_report_data.g.dart';
@JsonSerializable()
class NeighborReportData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerNeighborReportData> list;

  NeighborReportData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory NeighborReportData.fromJson(Map<String, dynamic> json) =>
      _$NeighborReportDataFromJson(json);
  Map<String, dynamic> toJson() => _$NeighborReportDataToJson(this);
}



@JsonSerializable()
class InnerNeighborReportData {
  final String reason;
  final String createTime;
  final String phone;
  final int id;
  final int momentId;

  factory InnerNeighborReportData.fromJson(Map<String, dynamic> json) =>
      _$InnerNeighborReportDataFromJson(json);

  InnerNeighborReportData(this.reason, this.createTime, this.phone, this.id, this.momentId);


  Map<String, dynamic> toJson() => _$InnerNeighborReportDataToJson(this);
}