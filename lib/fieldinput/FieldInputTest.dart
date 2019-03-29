import 'package:flutter/material.dart';

class FieldInputRoute extends StatefulWidget {
  @override
  _FieldInputRouteState createState() =>
      new _FieldInputRouteState();
}

class _FieldInputRouteState extends State<FieldInputRoute> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("input Test "),
      ),
      body: Center(
          child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  controller: _unameController,
                  onChanged: (v) {
                    print("onChange: $v");
                    print(_unameController.text);
                  },
                  keyboardType:TextInputType.numberWithOptions(),
                ),
              ],
          )
      ),
    );
  }
}