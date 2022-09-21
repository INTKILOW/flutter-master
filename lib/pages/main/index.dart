
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_master/user_controller.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Index();
}

class _Index extends State<Index> with AutomaticKeepAliveClientMixin {
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
