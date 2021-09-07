import 'package:flutter/material.dart';

class FlexTestDemo extends StatefulWidget {
  const FlexTestDemo({Key? key}) : super(key: key);

  @override
  _FlexTestDemoState createState() => _FlexTestDemoState();
}

class _FlexTestDemoState extends State<FlexTestDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex test"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.amber,
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  )
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
