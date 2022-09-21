import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 加载列表数据使用
typedef CreateWidget<T> = Widget Function(BuildContext context, int index, T t);

/// 加载单个对象使用
typedef CreateWidget2<T> = Widget Function(BuildContext context, T t);

typedef CreateApi = String Function();

/// 刷新开始
typedef OnRefresh = Future<void> Function();

/// 上拉加载
typedef OnPaging = Future<void> Function();

typedef PrepareBody = HashMap<String, dynamic> Function(
    HashMap<String, dynamic> body);

HashMap<String, dynamic> defaultPrepareBody(HashMap<String, dynamic> body) {
  return body;
}

class AutoList<T> extends StatefulWidget {
  final CreateWidget? createWidget;
  final CreateWidget2? createWidget2;
  final Widget? createHeader;
  final Widget? createFooter;
  final JsonParse<T> jsonParse;
  final CreateApi? createApi;
  final String method;

  final String? apiUrl;
  final PrepareBody prepareBody;
  final AutoListController? autoListController;

  final bool enablePullDown;
  final bool enablePullUp;

  final String noDataStr;
  final String noDataImg;

  final OnRefresh? onRefresh;
  final OnPaging? onPaging;

  const AutoList(
      {Key? key,
      this.createWidget,
      required this.jsonParse,
      this.createHeader,
      this.prepareBody = defaultPrepareBody,
      this.apiUrl,
      this.method = "post",
      this.autoListController,
      this.enablePullDown = true,
      this.enablePullUp = true,
      this.noDataStr = "暂无数据",
      this.noDataImg = "assets/images/empty/no_data.png",
      this.createWidget2,
      this.onRefresh,
      this.onPaging,
      this.createApi,
      this.createFooter})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutoList();
}

class _AutoList<T> extends State<AutoList> {
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

  bool isLoading() {
    return _refreshController.isLoading || _refreshController.isRefresh;
  }

  void clear() {
    setState(() {
      try {
        setState(() {
          data = [];
        });
      } catch (e) {}
    });
  }

  void delItem(int index) {
    setState(() {
      try {
        setState(() {
          data.removeAt(index + getHeaderCount());
        });
      } catch (e) {}
    });
  }

  void updateItem(int index, T t) {
    setState(() {
      try {
        setState(() {
          data[index + getHeaderCount()] = t;
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
      var url = widget.apiUrl ?? "";
      if (null != widget.createApi) {
        url = widget.createApi!();
      }

      BaseRefreshBean<T> res = await HttpManager().requestAsync(
          url: url,
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
      var url = widget.apiUrl ?? "";
      if (null != widget.createApi) {
        url = widget.createApi!();
      }
      BaseRefreshBean<T> res = await HttpManager().requestAsync(
          method: widget.method,
          url: url,
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
      child: ListView.builder(
        itemCount: data.length + getHeaderCount() + 1 + getFooterCount(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildItem(context, index),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    // debugPrint("index=${index}data.length==${data.length}");
    if (getHeaderCount() != 0 && index == 0) {
      return widget.createHeader!;
    }
    // no data
    else if (index == getHeaderCount() + data.length) {
      return Visibility(
        child: Container(
          margin: EdgeInsets.only(top: 80.h, bottom: 80.h),
          child: Column(
            children: [
              Image.asset(
                widget.noDataImg,
                width: 110.w,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  widget.noDataStr,
                  style: TextStyle(
                      color: const Color(0xFF8F8F8F), fontSize: 15.sp),
                ),
              )
            ],
          ),
        ),
        visible: (noData && data.isEmpty),
      );
    } else if (getFooterCount() != 0 &&
        index == getHeaderCount() + data.length + 1) {
      return widget.createFooter!;
    } else {
      if (widget.createWidget2 != null) {
        return widget.createWidget2!(context, _data);
      }
      if (widget.createWidget != null) {
        return widget.createWidget!(
            context, index, data[index - getHeaderCount()]);
      }
      return Container();
    }
  }

  int getHeaderCount() {
    return widget.createHeader == null ? 0 : 1;
  }

  int getFooterCount() {
    return widget.createFooter == null ? 0 : 1;
  }
}

class AutoListController<T> {
  _AutoList? state;

  void refresh({bool needMove = true}) {
    if (needMove) {
      state?._refreshController
          .requestRefresh(duration: const Duration(milliseconds: 100));
    } else {
      state?._onRefresh();
    }
  }

  dynamic getData() {
    return state?._data;
  }

  bool isLoading() {
    return state?.isLoading() ?? false;
  }

  void clear() {
    state?.clear();
  }

  void delItem(int index) {
    state?.delItem(index);
  }

  void updateItem(int index, T t) {
    state?.updateItem(index, t);
  }
}

abstract class BaseRefreshBean<T> {
  bool get hasPage;

  List<T>? get dataList;
}