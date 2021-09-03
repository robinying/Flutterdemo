import 'package:flutter/material.dart';

class BoxDemoWidget extends StatefulWidget {
  const BoxDemoWidget({Key? key}) : super(key: key);

  @override
  _BoxDemoWidgetState createState() => _BoxDemoWidgetState();
}

class _BoxDemoWidgetState extends State<BoxDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Box Demo",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: 80.0, minWidth: 40.0, maxWidth: 60.0),
            child: Container(
              color: Colors.cyanAccent,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 10.0, minWidth: 20.0),
            child: Container(
              color: Colors.red,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                //背景渐变
                borderRadius: BorderRadius.circular(6.0),
                //3像素圆角
                boxShadow: [
                  //阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
              child: Text(
                "login",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
