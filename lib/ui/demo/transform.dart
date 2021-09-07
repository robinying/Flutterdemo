import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  const TransformDemo({Key? key}) : super(key: key);

  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform demo"),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        spacing: 10.0,
        runSpacing: 10.0,
        alignment: WrapAlignment.start,
        children: [
          Transform(
            transform: Matrix4.skewY(0.3),
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text("Skew 0.3"),
              color: Colors.orangeAccent,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(-20.0, -5.0),
                child: Text("Hello world"),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
            //将Transform.rotate换成RotatedBox
            child: RotatedBox(
              quarterTurns: 1, //旋转90度(1/4圈)
              child: Text("Hello world"),
            ),
          ),
          Text("Hello ---")
        ],
      ),
    );
  }
}
