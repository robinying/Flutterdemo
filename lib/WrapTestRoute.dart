import 'package:flutter/material.dart';

class WrapTestRoute extends StatefulWidget {
  @override
  _WrapTestRouteState createState() => new _WrapTestRouteState();
}

class _WrapTestRouteState extends State<WrapTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Test "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child:Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(10.0), //10像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black54,
                          offset: Offset(2.0,2.0),
                          blurRadius: 4.0
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                )
            )
          ],
        ),
      ),
    );
  }
}