import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_master/bean/action_data.dart';
import 'package:flutter_master/core/http/http_manager.dart';
import 'package:flutter_master/main.dart';
import 'package:flutter_master/utils/device_util.dart';
import 'package:flutter_master/utils/page_jump.dart';
import 'package:flutter_master/utils/view_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum UrlType { webUrl, richText }

typedef OnPageFinished<T> = void Function(
    String? title, String url, int pageHeight);

/// web容器
///
///
///
class WebContainer extends StatefulWidget {
  // 链接地址
  final String urlData;

  // url 类型
  final UrlType urlType;
  final bool showLoadingProgress;
  final OnPageFinished? onPageFinished;

  final Set<JavascriptChannel>? javascriptChannels;

  const WebContainer(
      {Key? key,
      required this.urlData,
      required this.urlType,
      this.showLoadingProgress = true,
      this.onPageFinished,
      this.javascriptChannels})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebContainer();
}

class _WebContainer extends State<WebContainer> {
  WebViewController? _webViewController;
  final JSBridge _jsBridge = JSBridge();
  int _webProgress = 0;

  Set<JavascriptChannel> javascriptChannels = {};

  @override
  void initState() {
    super.initState();

    widget.javascriptChannels?.forEach((element) {
      javascriptChannels.add(element);
    });

    javascriptChannels.add(JavascriptChannel(
      name: "invoke",
      onMessageReceived: (JavascriptMessage message) {
        var failed = "";
        try {
          var msg = message.message;
          debugPrint("msg==$msg");
          var jsonMap = jsonDecode(msg);
          var method = jsonMap["method"];
          var params = jsonMap["params"] ?? "{}";
          var success = jsonMap["success"];
          failed = jsonMap["failed"];
          _jsBridge.process(method, jsonDecode(params), success, failed);
        } catch (e) {
          debugPrint("$e");
          _webViewController
              ?.runJavascript("window.$failed(${jsonEncode({"err": e})})");
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          backgroundColor: Get.theme.canvasColor,
          zoomEnabled: false,
          gestureNavigationEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: javascriptChannels,
          onPageFinished: (url) async {
            try {
              if (Get.isDarkMode) {
                //  /<style>p{color:white} a{color:white}</style>

                String changePAColor = """
                    var style = document.createElement('style');
                    style.type = 'text/css';
                    style.appendChild(document.createTextNode('p{color:white} a{color:white} strong{color:white}'));
                    var head = document.getElementsByTagName('head')[0];
                    head.appendChild(style);
                """;
                _webViewController?.runJavascript(changePAColor);
              }

              var title = await _webViewController
                  ?.runJavascriptReturningResult("document.title");
              title = title?.replaceAll("\"", "");
              var height = 0;
              try {
                var h = await _webViewController?.runJavascriptReturningResult(
                    "document.documentElement.scrollHeight");
                h = h ?? "0";
                height = int.parse(h);
              } catch (e) {}
              if (widget.onPageFinished != null) {
                widget.onPageFinished!(title, url, height);
              }
            } catch (e) {
              if (widget.onPageFinished != null) {
                widget.onPageFinished!("", url, 0);
              }
            }
          },
          onProgress: (progress) {
            setState(() {
              _webProgress = progress;
            });
          },
          navigationDelegate: (NavigationRequest request) {
            if (widget.urlType == UrlType.richText) {
              return NavigationDecision.navigate;
            }
            if (!request.url.startsWith("https") ||
                !request.url.startsWith("http")) {
              /// debugPrint("拦截");
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onWebViewCreated: (controller) {
            _webViewController = controller;
            _jsBridge._webViewController = controller;
            if (widget.urlType == UrlType.richText) {
              String html = """
                                <!DOCTYPE html>
                                <html>
                                <head>
                                  <title>详情</title>
                                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                </head>
                                <body style='margin:0 4px;padding:0'>
                                   ${widget.urlData}
                                </body>
                                </html>
                          """;
              // debugPrint("loadHtmlString=${html}");
              controller.loadHtmlString(html);
            } else {
              controller.loadUrl(
                widget.urlData,
                headers: {
                  "Authorization": "${HttpManager().getToken()}",
                  "Platform": "app",
                },
              );
            }

            /// debugPrint("onWebViewCreated");
          },
        ),
        Visibility(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              backgroundColor: Get.theme.dividerColor,
              minHeight: 1.h,
              valueColor: AlwaysStoppedAnimation<Color>(
                  MyApp.getSystemInfo().primaryColor),
              value: _webProgress / 100,
            ),
          ),
          visible: _webProgress != 100 && widget.showLoadingProgress,
        ),
      ],
    );
  }
}

class JSBridge {
  WebViewController? _webViewController;


  void process(
      String method, dynamic params, String success, String failed) async {
    switch (method) {
      case "getSystemInfo":
        DeviceInfo? info = await getDeviceInfo();
        _webViewController
            ?.runJavascript("window.$success(${jsonEncode(info?.toMap())})");
        break;
      case "alert":
        dynamic res;
        final BuildContext? context = Get.context;
        if (null != context) {
          res = await showMyDialog(context,
              text: params["title"] ?? "提示",
              cancel: params["cancel"] ?? "取消",
              confirm: params["confirm"] ?? "确认",
              mask: params["mask"] ?? false,
              content: Text(
                params["content"] ?? "",
                style: Get.textTheme.displaySmall,
              ));
        }
        _webViewController
            ?.runJavascript("window.$success(${jsonEncode({"data": res})})");
        break;
      case "pageIntent":
        PageJump.toModule(
            ActionData(params["path"], params["params"]));
        break;
    }
  }
}
