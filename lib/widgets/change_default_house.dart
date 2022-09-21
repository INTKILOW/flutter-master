import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_master/bean/house_data.dart';
import 'package:flutter_master/main.dart';

class ChangeDefaultHouse extends StatefulWidget {
  final List<HouseData> data;
    HouseData? current;

    ChangeDefaultHouse({Key? key, required this.data, this.current})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeDefaultHouse();
}

class _ChangeDefaultHouse extends State<ChangeDefaultHouse> {
  HouseData? _current;

  @override
  void initState() {
    _current = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            widget.data.length,
            (index) {
              return GestureDetector(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.data[index].fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                      Visibility(
                        child: Icon(
                          Icons.check,
                          color: MyApp.getSystemInfo().primaryColor,
                        ),
                        visible: _current?.id == widget.data[index].id,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5.h,
                        color: const Color(0xFFEAEAEA),
                      ),
                    ),
                  ),
                  height: 44.h,
                ),
                onTap: () {
                  setState(() {
                    _current = widget.data[index];
                    widget.current = _current;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
