import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input Test "),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, //关联focusNode1
                decoration: InputDecoration(
                    labelText: "input1",
                    hintText: "hintText1",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)),
              ),
              TextField(
                focusNode: focusNode2, //关联focusNode2
                decoration: InputDecoration(labelText: "input2"),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          "移动焦点",
                          style: TextStyle(
                              inherit: false, //2.不继承默认样式
                              color: Colors.green),
                        ),
                        onPressed: () {
                          //将焦点从第一个TextField移到第二个TextField
                          // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                          // 这是第二种写法
                          if (null == focusScopeNode) {
                            focusScopeNode = FocusScope.of(context);
                          }
                          if (focusNode1.hasFocus) {
                            focusScopeNode.requestFocus(focusNode2);
                          } else if (focusNode2.hasFocus) {
                            focusScopeNode.requestFocus(focusNode1);
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          // 当所有编辑框都失去焦点时键盘就会收起
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
