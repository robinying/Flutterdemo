import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  final String title;

  const NewRoute({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                debugDumpRenderTree();
              },
              child: Text("dump"),
            ),
            Text("new Router"),
            Image.asset("assets/images/location_active.png"),
            Image.network(
              "https://cdn2.jianshu.io/assets/default_avatar/6-fd30f34c8641f6f32f5494df5d6b8f3c.jpg",
              width: 100,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
