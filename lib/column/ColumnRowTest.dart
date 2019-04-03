import 'package:flutter/material.dart';

class ColumnRoute extends StatefulWidget {
  @override
  _ColumnRouteState createState() => new _ColumnRouteState();
}

class _ColumnRouteState extends State<ColumnRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child:Column(
          //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Robin "),
              ],
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Robin "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" hello world ", style: TextStyle(fontSize: 30.0,color: Colors.deepOrange),),
                Text(" I am Jack "),
              ],
            ),
          ],
        ),
      ),
    );
  }
}