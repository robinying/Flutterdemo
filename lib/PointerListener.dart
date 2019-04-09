import 'package:flutter/material.dart';

class PointerListenerRoute extends StatefulWidget {
  @override
  _PointerListenerState createState() {
    return new _PointerListenerState();
  }
}

class _PointerListenerState extends State<PointerListenerRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Pointer Listener Test")),
      body: Column(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print(" blue down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("text down1"),
            //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          )
        ],
      ),
    );
  }
}
