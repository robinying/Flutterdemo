import 'package:flutter/material.dart';
import 'SwitchTest.dart';
import 'package:flutter_demo/fieldinput/FieldInputTest.dart';
import 'package:flutter_demo/fieldinput/FoucusInputTest.dart';
import 'package:flutter_demo/fieldinput/FormInputTest.dart';
import 'package:flutter_demo/column/ColumnRowTest.dart';
import 'package:flutter_demo/column/FlexLayoutTestRoute.dart';
import 'package:flutter_demo/WrapTestRoute.dart';
import 'package:flutter_demo/Scaffold.dart';
import 'package:flutter_demo/SingleChildScrollViewTestRoute.dart';
import 'dart:developer';
import 'dart:async';

void main() {
//  runApp(new MaterialApp(
//    title: 'Flutter Tutorial',
//    home: new TutorialHome(),
//  ));
//  runZoned(() => runApp(MyApp()), zoneSpecification: new ZoneSpecification(
//      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        parent.print(zone, "Intercepted: $line");
//      }),
//  );
  runApp(new MyApp());
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('TutorialHome title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Text('Hello, world!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("open Scafford Text"),
              textColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ScaffoldRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("Scroll View"),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new SingleChildScrollViewTestRoute();
                    }))
                  },
            ),
            FlatButton(
              child: Text("open test"),
              textColor: Colors.red,
              onPressed: () {
                //导航到新路由

                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new RouteTest();
                }));
              },
            ),
            FlatButton(
              child: Text("open Switch Text"),
              textColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new SwitchAndCheckBoxTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("open Field input"),
              textColor: Colors.deepOrange,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new FieldInputRoute();
                }));
              },
            ),
            RaisedButton(
              child: Text("Field Focus"),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new FocusTestRoute();
                    }))
                  },
            ),
            RaisedButton(
              child: Text(
                "Form Test",
                style: TextStyle(color: Colors.amber),
              ),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new FormTestRoute();
                    }))
                  },
            ),
            RaisedButton(
              child: Text(
                "Column Test",
                style: TextStyle(color: Colors.indigo),
              ),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new ColumnRoute();
                    }))
                  },
            ),
            RaisedButton(
              child: Text(
                "Flex Test",
                style: TextStyle(color: Colors.indigo),
              ),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new FlexLayoutTestRoute();
                    }))
                  },
            ),
            RaisedButton(
              child: Text(
                "Wrap Test",
                style: TextStyle(color: Colors.amber),
              ),
              onPressed: () => {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return new WrapTestRoute();
                    }))
                  },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RouteTest extends StatelessWidget {
  String icons = "\uE914 \uE000 \uE90D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Test "),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("hello world"),
            Text(
              "I am Jack",
              style: TextStyle(
                  inherit: false, //2.不继承默认样式
                  color: Colors.grey),
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 200.0,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.blueGrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
//        child: Text.rich(TextSpan(
//            children: [
//              TextSpan(
//                  text: "Home: "
//              ),
//              TextSpan(
//                  text: "https://flutterchina.club",
//                  style: TextStyle(
//                      color: Colors.blue
//                  ),
//              ),
//            ]
//        )),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0}) : super(key: key);

  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

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
          title: Text("_CounterWidgetState"),
        ),
        body: Center(
          child: FlatButton(
            child:
                Text('$_counter', style: Theme.of(context).textTheme.display2),
            //点击后计数器自增
            onPressed: () => setState(() => ++_counter),
          ),
        ));
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
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
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
