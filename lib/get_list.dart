import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MaterialList extends StatelessWidget {
  const MaterialList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataListDemo();
  }
}

class DataListDemo extends StatefulWidget {
  const DataListDemo({Key? key}) : super(key: key);

  @override
  _DataListDemoState createState() => _DataListDemoState();
}

class _DataListDemoState extends State<DataListDemo> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  final ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List"),
      ),
      body: Column(
        children: [
          ListTile(title: Text("单词列表")),
          SizedBox(
            height: MediaQuery.of(context).size.height - 24 - 56 - 56,
            child: ListView.separated(
                controller: _controller,
                itemBuilder: (context, index) {
                  if (_words[index] == loadingTag) {
                    //不足100条，继续获取数据
                    if (_words.length - 1 < 100) {
                      //获取数据
                      _retrieveData();
                      //加载时显示loading
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(strokeWidth: 2.0)),
                      );
                    } else {
                      //已经加载了100条数据，不再获取数据。
                      return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "没有更多了",
                            style: TextStyle(color: Colors.grey),
                          ));
                    }
                  }
                  //显示单词列表项
                  return ListTile(
                    title: Text(_words[index]),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) => Divider(height: .5),
                itemCount: _words.length),
          ),
        ],
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward,color: Colors.white,),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              }),
    );
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }
}
