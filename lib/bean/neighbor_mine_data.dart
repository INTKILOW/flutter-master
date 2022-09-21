import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'media_data.dart';
part 'neighbor_mine_data.g.dart';
@JsonSerializable()
class NeighborMineData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerNeighborMineData> list;

  NeighborMineData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory NeighborMineData.fromJson(Map<String, dynamic> json) =>
      _$NeighborMineDataFromJson(json);
  Map<String, dynamic> toJson() => _$NeighborMineDataToJson(this);
}



@JsonSerializable()
class InnerNeighborMineData {
  final String avatar;
  final String content;
  final int id;
  final String? momentContent;
  final int momentId;
  final int type;
  final String userName;
  final String? createTime;
  factory InnerNeighborMineData.fromJson(Map<String, dynamic> json) =>
      _$InnerNeighborMineDataFromJson(json);

  InnerNeighborMineData(this.avatar, this.content, this.id, this.momentContent, this.momentId, this.type, this.userName, this.createTime);


  Map<String, dynamic> toJson() => _$InnerNeighborMineDataToJson(this);
}