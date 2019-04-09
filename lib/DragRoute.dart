import 'package:flutter/material.dart';

class DragRoute extends StatefulWidget{

  @override
  _DragRouteState createState() {
    return new _DragRouteState();
  }
}

class _DragRouteState extends State<DragRoute>{
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  double _top_new = 50.0;
  double _left_new = 50.0;
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(title: Text("Drage Route")),
    body: Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        ),
        Positioned(
          top: _top_new,
          left: _left_new,
          child: GestureDetector(
            child: CircleAvatar(child: Text("Z")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left_new += e.delta.dx;
                _top_new += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        ),
      ],
    ),
  );
  }
}