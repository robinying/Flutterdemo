import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FutureTestDemo extends StatefulWidget {
  const FutureTestDemo({Key? key}) : super(key: key);

  @override
  _FutureTestDemoState createState() => _FutureTestDemoState();
}

class _FutureTestDemoState extends State<FutureTestDemo> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: Center(
        child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(
                          title: Text(e["full_name"]),
                          trailing: Image.network(e["owner"]["avatar_url"]),
                        ))
                    .toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
