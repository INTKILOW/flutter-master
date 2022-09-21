import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';
part 'point_goods_info_data.g.dart';
@JsonSerializable()
class PointGoodsInfoData extends BaseRefreshBean {
  final bool hasNextPage;
  final List<InnerPointGoodsInfoData> list;

  PointGoodsInfoData(this.hasNextPage, this.list);

  @override
  List? get dataList => list;

  @override
  bool get hasPage => hasNextPage;

  factory PointGoodsInfoData.fromJson(Map<String, dynamic> json) =>
      _$PointGoodsInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$PointGoodsInfoDataToJson(this);
}



@JsonSerializable()
class InnerPointGoodsInfoData {
  final int id;
  final String communityName;
  final String goodsName;
  final String thumbnail;
  final String orderNo;
  final int status;
  final int points;

  final String? createTime;
  factory InnerPointGoodsInfoData.fromJson(Map<String, dynamic> json) =>
      _$InnerPointGoodsInfoDataFromJson(json);

  InnerPointGoodsInfoData(this.id, this.communityName, this.goodsName, this.thumbnail, this.orderNo, this.status, this.points, this.createTime);


  Map<String, dynamic> toJson() => _$InnerPointGoodsInfoDataToJson(this);
}