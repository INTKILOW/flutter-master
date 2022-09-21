import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'media_data.dart';
part 'neighbor_data.g.dart';
@JsonSerializable()
class NeighborData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerNeighborData> list;

  NeighborData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory NeighborData.fromJson(Map<String, dynamic> json) =>
      _$NeighborDataFromJson(json);
  Map<String, dynamic> toJson() => _$NeighborDataToJson(this);
}



@JsonSerializable()
class InnerNeighborData {
  final String createTime;
  final String avatar;
  final int commentCount;
  final int id;
  final int isHot;
  final int likeCount;
  final int mediaType;
  final String communityName;
  final String topicName;
  final String userName;
  final List<MediaData>? mediaList;
  final String content;
  final List<MediaData>? likeList;
  final bool isLike;
  final bool isMine;
  factory InnerNeighborData.fromJson(Map<String, dynamic> json) =>
      _$InnerNeighborDataFromJson(json);

  InnerNeighborData(this.createTime, this.avatar, this.commentCount, this.id, this.isHot, this.likeCount, this.mediaType, this.communityName, this.topicName, this.userName, this.mediaList, this.content, this.likeList, this.isLike, this.isMine);



  Map<String, dynamic> toJson() => _$InnerNeighborDataToJson(this);
}