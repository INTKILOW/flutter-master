import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'point_info_data.g.dart';
@JsonSerializable()
class PointInfoData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerPointInfoData> list;

  PointInfoData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory PointInfoData.fromJson(Map<String, dynamic> json) =>
      _$PointInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$PointInfoDataToJson(this);
}



@JsonSerializable()
class InnerPointInfoData {
  final int id;
  final int points;
  final int dir;
  final String createTime;
  final String? name;


  factory InnerPointInfoData.fromJson(Map<String, dynamic> json) =>
      _$InnerPointInfoDataFromJson(json);

  InnerPointInfoData(this.id, this.points, this.createTime, this.name, this.dir);



  Map<String, dynamic> toJson() => _$InnerPointInfoDataToJson(this);
}