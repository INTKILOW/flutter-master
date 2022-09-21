import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'notice_data.g.dart';
@JsonSerializable()
class NoticeData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerNoticeData> list;

  NoticeData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory NoticeData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDataFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeDataToJson(this);
}



@JsonSerializable()
class InnerNoticeData {
  final String createTime;
  final String summary;
  final String thumbnail;
  final String title;
  final int id;
  final int communityId;
  final int pv;
  final String? communityName;
  final String? content;
  final String? shareLink;
  factory InnerNoticeData.fromJson(Map<String, dynamic> json) =>
      _$InnerNoticeDataFromJson(json);

  InnerNoticeData(this.createTime, this.summary, this.thumbnail, this.title, this.id, this.pv,this.communityName, this.content, this.communityId, this.shareLink);


  Map<String, dynamic> toJson() => _$InnerNoticeDataToJson(this);
}