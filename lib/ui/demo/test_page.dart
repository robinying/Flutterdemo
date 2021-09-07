import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, this.initValue = 0}) : super(key: key);
  final int initValue;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test count:$_counter"),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Text("Add"),
            ),
            RaisedButton(
              onPressed: () {
                // 查找父级最近的Scaffold对应的ScaffoldState对象
                // ScaffoldState _state = context.findAncestorStateOfType<_TestPageState>() as ScaffoldState;
                // //调用ScaffoldState的showSnackBar来弹出SnackBar
                // _state.showSnackBar(
                //   SnackBar(
                //     content: Text("我是SnackBar"),
                //   ),
                // );
              },
              child: Text("显示SnackBar"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(TestPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
}
