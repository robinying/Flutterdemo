import 'package:flutter/material.dart';
import 'dart:developer';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = false; //维护单选开关状态
  bool _checkboxSelected = false; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Test "),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected, //当前状态
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            //activeColor: Colors.indigo[400], //选中时的颜色
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      )),
    );
  }
}
