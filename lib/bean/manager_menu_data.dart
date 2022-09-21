 

import 'package:flutter/material.dart';

import 'action_data.dart';

class ManagerMenuData {

  final String name;
  int count;
  final ActionData actionData;
  IconData? iconData;

  ManagerMenuData(this.name, this.actionData,this.count,{this.iconData});


}