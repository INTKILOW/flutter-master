import 'package:flutter/cupertino.dart';

import 'WebContainer.dart';

class RichTextWidget extends StatefulWidget {

  final String? content;

  const RichTextWidget({Key? key, this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RichTextWidget();


}

class _RichTextWidget extends State<RichTextWidget> {
  var height = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: WebContainer(
        urlData: widget.content ?? "",
        urlType: UrlType.richText,
        onPageFinished: (title, url, pageHeight) {
          setState(() {
            height = pageHeight * 1.0;
          });
        },
      ),
    );
  }

}