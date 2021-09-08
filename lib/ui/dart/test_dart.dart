import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class TestDartDemo extends StatefulWidget {
  const TestDartDemo({Key? key}) : super(key: key);

  @override
  _TestDartDemoState createState() => _TestDartDemoState();
}

class _TestDartDemoState extends State<TestDartDemo> {
  @override
  Widget build(BuildContext context) {
    Runes runes = new Runes('\u{1f605} \u6211');
    var str1 = String.fromCharCodes(runes);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Usage"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(str1),
          ],
        ),
      ),
    );
  }

  void _getNetwork() async {
    try {
      var response = await Dio().get('http://www.baidu.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void _map(){
    var map6 = {for (var i = 0; i < 5; i++) "key$i": "value$i"};
    assert(map6.length == 5);
  }

  void _dartType() {
    dynamic temp ="1234";
    temp = true;
    if(temp is bool){
      print(temp);
    }
    int i = 1; //整数值
    double d = 1.0; //double  64-bit (双精度) 浮点数
    int bitLength = i.bitLength;
    print('bitLength: ${bitLength}'); //bitLength判断int值需要多少bit位
    double maxFinite = double.maxFinite;
    print('maxFinite: ${maxFinite}'); //maxFinitedouble的最大值
    //int和double都是num的子类
    num n1 = 1;
    num n2 = 1.0;
    //支持十进制、十六进制
    int i1 = 0xfff;
    //科学计数法
    double d1 = 1.2e2; //120.0
    //转换
    //String->int
    int i2 = int.parse('1');
    double d2 = 1; //当double的值为int值时，int自动转成double
    print('d2: ${d2}');
  }

  void _testStr() {
    var str = '''1111
    111
    3333
    ''';
    StringBuffer stringBuffer = StringBuffer();
    //链式调用
    stringBuffer..write("object111")..write("object222");
    print(stringBuffer.toString());
  }

  void _testList() {
    var list1 = [];
    for (int i = 0; i < 6; i++) {
      list1.add(i);
    }
    print(list1.length.toString() + list1[3].toString());
  }

  @override
  void initState() {
    super.initState();
    _dartType();
    _testStr();
    _testList();
    _map();
    _getNetwork();
  }
}

class Point {
  final int x;
  final int y;
  final int z;

  Point(int x, int y, int z)
      : x = x,
        y = y,
        z = z;
}
