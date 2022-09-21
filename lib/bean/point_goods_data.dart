import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'point_goods_data.g.dart';
@JsonSerializable()
class PointGoodsData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerPointGoodsData> list;

  PointGoodsData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory PointGoodsData.fromJson(Map<String, dynamic> json) =>
      _$PointGoodsDataFromJson(json);
  Map<String, dynamic> toJson() => _$PointGoodsDataToJson(this);
}



@JsonSerializable()
class InnerPointGoodsData {
  final int id;
  final int points;
  final String name;
  final String thumbnail;
  factory InnerPointGoodsData.fromJson(Map<String, dynamic> json) =>
      _$InnerPointGoodsDataFromJson(json);

  InnerPointGoodsData(this.id, this.points, this.name, this.thumbnail);



  Map<String, dynamic> toJson() => _$InnerPointGoodsDataToJson(this);
}