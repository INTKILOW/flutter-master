import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_master/widgets/auto_list.dart';

import 'activity_data.dart';
import 'banner_data.dart';
import 'module_data.dart';
import 'neighbor_data.dart';
import 'notice_data.dart';
part 'home_data.g.dart';


@JsonSerializable()
class HomeData extends BaseRefreshBean{


  final InnerHomeData data;

  HomeData(this.data);

  @override
  List? get dataList => [1];

  @override
  bool get hasPage => false;


  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}
@JsonSerializable()
class InnerHomeData {

  final List<InnerActivityData> activityList;
  final List<InnerModuleData> menus;
  final List<InnerNeighborData> momentList;
  final List<InnerNoticeData> noticeList;
  final List<BannerData> bannerList;
  factory InnerHomeData.fromJson(Map<String, dynamic> json) =>
      _$InnerHomeDataFromJson(json);
  InnerHomeData(this.activityList, this.menus, this.momentList, this.noticeList, this.bannerList);
  Map<String, dynamic> toJson() => _$InnerHomeDataToJson(this);
}