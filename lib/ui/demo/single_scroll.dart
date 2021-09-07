import 'package:flutter/material.dart';

class ScrollDemo extends StatelessWidget {
  const ScrollDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll demo"),
      ),
      body: SingleScrollTestDemo(),
    );
  }
}

class SingleScrollTestDemo extends StatelessWidget {
  const SingleScrollTestDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: str
              .split("")
              .map((e) => Text(
                    e,
                    textScaleFactor: 2.0,
                  ))
              .toList(),
        ),
      ),
    ));
  }
}
