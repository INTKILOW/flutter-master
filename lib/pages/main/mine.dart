import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_master/user_controller.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Mine();
}

class _Mine extends State<Mine> with AutomaticKeepAliveClientMixin {
  final UserController _userController = Get.find();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Text('1234'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
