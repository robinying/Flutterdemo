import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/new_route.dart';
import 'package:flutter_demo/test_page.dart';
import 'package:flutter_demo/switch_check.dart';
import 'package:flutter_demo/form.dart';
import 'package:flutter_demo/flex_test.dart';
import 'package:flutter_demo/list_item.dart';
import 'package:flutter_demo/wrap_flow.dart';
import 'package:flutter_demo/stack.dart';
import 'package:flutter_demo/box.dart';
import 'package:flutter_demo/transform.dart';
import 'package:flutter_demo/news_demo.dart';
import 'package:flutter_demo/shop.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new HomeWidget(),
      routes: {
        "new_router": (context) => NewRoute(title: "Demo"),
        "form": (context) => FormTestRoute(),
        "flex_test": (context) => FlexTestDemo(),
        "list_test": (context) => RandomWord(),
        "wrap_flow": (context) => WrapFlowWidget(),
        "stack_demo": (context) => StackDemoWidget(),
        "box_demo": (context) => BoxDemoWidget(),
        "transform_demo": (context) => TransformDemo(),
        "news_demo": (context) => NewsDemoWidget(),
      },
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  createState() => new HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  // final _suggestions = <WordPair>[];
  //
  // final _saved = new Set<WordPair>();
  //
  // final _biggerFont = const TextStyle(
  //     fontSize: 18.0,
  //     color: Color.fromARGB(255, 0, 100, 100),
  //     fontWeight: FontWeight.w800);

  //final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),

                // SwitchAndCheckBoxTestRoute(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "list_test");
                    },
                    icon: Icon(Icons.person)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "flex_test");
                    },
                    icon: Icon(Icons.airline_seat_flat)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "form");
                  },
                  child: Text(
                    "form",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return ShoppingList(
                          products: <Product>[ new Product(name: 'Eggs'),
                            new Product(name: 'Flour'),
                            new Product(name: 'Chocolate chips'),
                          ]);
                    }));
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text(
                    "Shop",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return new NewRoute(
                              title: "new Router111",
                            );
                          }));
                    },
                    color: Colors.amber[700],
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("New Router")),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 6.0,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "wrap_flow");
                    },
                    icon: Icon(Icons.print)),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "stack_demo");
                    },
                    color: Colors.green[700],
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("Stack")),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "box_demo");
                    },
                    color: Colors.limeAccent[700],
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("Box")),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "transform_demo");
                    },
                    color: Colors.blue[300],
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("Transform")),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "news_demo");
                    },
                    color: Colors.blue[300],
                    colorBrightness: Brightness.dark,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text("News Demo")
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "new_router");
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return NewRoute(title: "new Router2222");
          // }));
        },
        child: new Icon(Icons.add),
      ),
    );
  }

// Widget _buildSuggestions() {
//   return new ListView.builder(
//     padding: const EdgeInsets.all(16.0),
//     itemBuilder: (context, i) {
//       if (i.isOdd) return new Divider();
//
//       final index = i ~/ 2;
//       if (index >= _suggestions.length) {
//         _suggestions.addAll(generateWordPairs().take(10));
//       }
//       return _buildRow(_suggestions[index]);
//     },
//   );
// }
//
// Widget _buildRow(WordPair pair) {
//   final alreadySaved = _saved.contains(pair);
//   return new ListTile(
//     title: new Text(
//       pair.asPascalCase,
//       style: _biggerFont,
//     ),
//     trailing: new Icon(
//       alreadySaved ? Icons.favorite : Icons.favorite_border,
//       color: alreadySaved ? Colors.red : null,
//     ),
//     onTap: () {
//       setState(
//         () {
//           if (alreadySaved) {
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         },
//       );
//     },
//   );
// }
}
