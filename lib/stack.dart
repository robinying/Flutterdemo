import 'package:flutter/material.dart';

class StackDemoWidget extends StatefulWidget {
  const StackDemoWidget({Key? key}) : super(key: key);

  @override
  _StackDemoWidgetState createState() => _StackDemoWidgetState();
}

class _StackDemoWidgetState extends State<StackDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Demo"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: Text("Hello world", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            ),
            Positioned(
              right: 20.0,
                child: Container(
                  // height: 120.0,
                  // width: 120.0,
                  color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,
                  alignment: Alignment(1.0,-0.5),
                  child: FlutterLogo(
                    size: 60,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
