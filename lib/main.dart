import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_demo/new_route.dart';
import 'package:flutter_demo/test_page.dart';
import 'package:flutter_demo/switch_check.dart';
import 'package:flutter_demo/form.dart';
import 'package:flutter_demo/flex_test.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
      routes: {
        "new_router": (context) => NewRoute(title: "Demo"),
        "form": (context) => FormTestRoute(),
        "flex_test": (context) => FlexTestDemo(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(
      fontSize: 18.0,
      color: Color.fromARGB(255, 0, 100, 100),
      fontWeight: FontWeight.w800);

  //final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            // SwitchAndCheckBoxTestRoute(),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "flex_test");
                },
                icon: Icon(Icons.airline_seat_flat)),
            IconButton(
              onPressed: () {
                //print(_controller.text);
                Navigator.pushNamed(context, "form");
              },
              icon: Icon(Icons.access_alarm),
            ),
            // RaisedButton.icon(
            //   icon: Icon(Icons.send),
            //   label: Text("发送"),
            //   onPressed: () {},
            // ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.yellow[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {},
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return new NewRoute(
                      title: "new Router111",
                    );
                  }));
                },
                child: Text("New Router")),
            // MaterialButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return new TestPage();
            //       }));
            //     },
            //     child: Text("Test Page")),
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

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(
          () {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          },
        );
      },
    );
  }
}
