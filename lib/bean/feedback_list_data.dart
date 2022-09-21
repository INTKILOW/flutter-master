import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'media_data.dart';
part 'feedback_list_data.g.dart';
@JsonSerializable()
class FeedbackListData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerFeedbackListData> list;

  FeedbackListData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory FeedbackListData.fromJson(Map<String, dynamic> json) =>
      _$FeedbackListDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackListDataToJson(this);
}



@JsonSerializable()
class InnerFeedbackListData {


  final String communityName;
  final int id;
  final int status;
  final int type;
  final String userName;
  final String remark;
  final String content;
  final String phone;

  final List<MediaData>? mediaList;
  final String createTime;
  factory InnerFeedbackListData.fromJson(Map<String, dynamic> json) =>
      _$InnerFeedbackListDataFromJson(json);

  InnerFeedbackListData(this.communityName, this.id, this.status, this.type, this.userName, this.remark, this.mediaList, this.createTime, this.content, this.phone);


  Map<String, dynamic> toJson() => _$InnerFeedbackListDataToJson(this);
}