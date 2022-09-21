import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:flutter_master/widgets/auto_list.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AutoList2<T> extends StatefulWidget {
  final CreateWidget? createWidget;
  final Widget? createHeader;
  final Widget? createFooter;
  final JsonParse<T> jsonParse;
  final String method;

  final String apiUrl;
  final PrepareBody prepareBody;
  final AutoListController2? autoListController;

  final bool enablePullDown;
  final bool enablePullUp;

  final String noDataStr;
  final String noDataImg;

  final OnRefresh? onRefresh;
  final OnPaging? onPaging;
  final SliverGridDelegate gridDelegate;

  const AutoList2(
      {Key? key,
      this.createWidget,
      required this.jsonParse,
      this.createHeader,
      this.prepareBody = defaultPrepareBody,
      required this.apiUrl,
      this.method = "post",
      this.autoListController,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.noDataStr = "暂无数据",
      this.noDataImg = "assets/images/empty/no_data.png",
      this.onRefresh,
      this.onPaging,
      this.createFooter,
      required this.gridDelegate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutoList2();
}

class _AutoList2<T> extends State<AutoList2> {
  // 单页数据
  dynamic _data;
  var pageSize = 10;
  var page = 1;
  var hasNextPage = true;

  // 数据
  List<T> data = [];

  // 页面没有数据
  var noData = false;
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.autoListController?.state = this;
    _onRefresh();
  }

  void delItem(int index) {
    setState(() {
      try {
        setState(() {
          data.removeAt(index);
        });
      } catch (e) {}
    });
  }

  void updateItem(int index, T t) {
    setState(() {
      try {
        setState(() {
          data[index] = t;
        });
      } catch (e) {}
    });
  }

  void _onRefresh() async {
    if (widget.onRefresh != null) {
      try {
        await widget.onRefresh!();
      } catch (e) {}
    }

    // 初始化数据

    hasNextPage = true;
    page = 1;

    var body = HashMap<String, dynamic>();
    body["current"] = page;
    body["pageSize"] = pageSize;
    try {
      BaseRefreshBean<T> res = await HttpManager().requestAsync(
          url: widget.apiUrl,
          method: widget.method,
          // data: widget.prepareBody(body),
          params: widget.prepareBody(body),
          jsonParse: widget.jsonParse);
      if (res.dataList != null) {
        data.clear();
        setState(() {
          data.addAll(res.dataList!);

          if (res.dataList!.isEmpty) {
            noData = true;
          } else {
            noData = false;
          }
        });
      } else {
        setState(() {
          noData = true;
          data.clear();
        });
      }
      hasNextPage = res.hasPage;
      if (hasNextPage) {
        page += 1;
        _refreshController.resetNoData();
      } else {
        _refreshController.loadNoData();
      }
      _refreshController.refreshCompleted();

      _data = res;
    } catch (e) {
      hasNextPage = true;
      /// debugPrint(e.toString());

      _refreshController.refreshFailed();
      setState(() {
        noData = true;
        data.clear();
      });
    }
  }

  void _onLoading() async {
    if (widget.onPaging != null) {
      try {
        await widget.onPaging!();
      } catch (e) {}
    }

    var body = HashMap<String, dynamic>();
    body["current"] = page;
    body["pageSize"] = pageSize;
    try {
      BaseRefreshBean<T> res = await HttpManager().requestAsync(
          method: widget.method,
          url: widget.apiUrl,
          params: widget.prepareBody(body),
          jsonParse: widget.jsonParse);

      if (res.dataList != null) {
        setState(() {
          data.addAll(res.dataList!);
        });
      }
      hasNextPage = res.hasPage;

      if (!hasNextPage) {
        _refreshController.loadNoData();
      } else {
        page += 1;
        _refreshController.loadComplete();
      }
    } catch (e) {
      hasNextPage = true;
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp && !noData,
      onLoading: _onLoading,
      onRefresh: _onRefresh,
      header: const ClassicHeader(
        refreshStyle: RefreshStyle.Follow,
        completeDuration: Duration(milliseconds: 250),
      ),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 250),
      ),
      controller: _refreshController,
      child:SingleChildScrollView(child: Column(children: [
        widget.createHeader??Container(),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: widget.gridDelegate,
          itemBuilder: (ctx, index) {
            return buildItem(context, index);
          },
        )
      ],),),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    if (widget.createWidget != null) {
      return widget.createWidget!(context, index, data[index]);
    } else {
      return Container();
    }
  }
}

class AutoListController2<T> {
  _AutoList2? state;

  List? getData() {
    return state?._data;
  }

  void refresh({bool needMove = true}) {
    if (needMove) {
      state?._refreshController.requestRefresh();
    } else {
      state?._onRefresh();
    }
  }

  void delItem(int index) {
    state?.delItem(index);
  }

  void updateItem(int index, T t) {
    state?.updateItem(index, t);
  }
}
