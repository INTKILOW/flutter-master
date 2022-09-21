import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'comment_data.g.dart';
@JsonSerializable()
class CommentData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerCommentData> list;

  CommentData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
  Map<String, dynamic> toJson() => _$CommentDataToJson(this);
}



@JsonSerializable()
class InnerCommentData {
  final String userName;
  final String avatar;
  final String content;
  final String createTime;
  final int id;
  final bool isMine;
  factory InnerCommentData.fromJson(Map<String, dynamic> json) =>
      _$InnerCommentDataFromJson(json);

  InnerCommentData(this.userName, this.avatar, this.content, this.createTime, this.id, this.isMine);


  Map<String, dynamic> toJson() => _$InnerCommentDataToJson(this);
}