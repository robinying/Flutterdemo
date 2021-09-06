import 'package:flutter/material.dart';

class NetWorkDemo extends StatefulWidget {
  const NetWorkDemo({Key? key}) : super(key: key);

  @override
  _NetWorkDemoState createState() => _NetWorkDemoState();
}

class _NetWorkDemoState extends State<NetWorkDemo> {
  Future<String> _getData() async {
    return Future.delayed(Duration(seconds: 2)).then((value) => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network Demo"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
