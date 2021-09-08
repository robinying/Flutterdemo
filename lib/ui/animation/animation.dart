import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _scale = new Tween(begin: 0.0, end: 2.0).animate(controller);

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
    controller.forward();
    _getPath();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _getPath() async {
    Directory path = await getTemporaryDirectory();
    String tempPath =path.path;
    print("tempPath:$tempPath");

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("appDocPath:"+appDocPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/pokemongo.png",
                width: animation.value, height: animation.value),
            ScaleTransition(
              scale: _scale,
              child: Image.asset("assets/images/pokemongo.png",
                  width: _scale.value, height: _scale.value),
            )
          ],
        ),
      ),
    );
  }
}
