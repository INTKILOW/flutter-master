import 'package:json_annotation/json_annotation.dart';
part 'point_goods_detail_data.g.dart';
@JsonSerializable()
class PointGoodsDataDetailData {
  final int id;
  final int exchangeNum;
  final int limitCount;
  final String attribute;
  final String content;
  final String name;
  final String picture;
  final int points;
  final int stockNum;



  factory PointGoodsDataDetailData.fromJson(Map<String, dynamic> json) =>
      _$PointGoodsDataDetailDataFromJson(json);

  PointGoodsDataDetailData(this.id, this.exchangeNum, this.limitCount, this.attribute, this.content, this.name, this.picture, this.points, this.stockNum);


  Map<String, dynamic> toJson() => _$PointGoodsDataDetailDataToJson(this);
}