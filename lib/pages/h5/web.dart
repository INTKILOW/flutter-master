import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_master/local_router.dart';
import 'package:flutter_master/widgets/WebContainer.dart';

void navWebPage({String urlData = "", UrlType urlType = UrlType.webUrl}) {
  Get.toNamed(WEB_PAGE, arguments: {"urlData": urlData, "urlType": urlType});
}

class Web extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Web();
}

class _Web extends State<Web> {
  var _title = "";

  @override
  Widget build(BuildContext context) {
    var urlData = Get.arguments["urlData"] ?? "";
    var urlType = Get.arguments["urlType"];

    if (urlType == 1) {
      urlType = UrlType.webUrl;
    }
    if (urlType == 2) {
      urlType = UrlType.richText;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: WebContainer(
        onPageFinished: (title, url, pageHeight) {
          setState(() {
            if (title != null && title.isNotEmpty) {
              _title = title;
            } else {
              _title = urlData;
            }
          });
        },
        urlType: urlType ?? UrlType.richText,
        urlData: urlData,
      ),
    );
  }
}
