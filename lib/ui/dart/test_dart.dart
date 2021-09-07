import 'package:flutter/material.dart';

class TestDartDemo extends StatefulWidget {
  const TestDartDemo({Key? key}) : super(key: key);

  @override
  _TestDartDemoState createState() => _TestDartDemoState();
}

class _TestDartDemoState extends State<TestDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dart Usage"),
      ),
    );
  }

  void _dartType() {
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

  @override
  void initState() {
    super.initState();
    _dartType();
  }
}
