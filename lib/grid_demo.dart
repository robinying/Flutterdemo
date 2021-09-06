import 'package:flutter/material.dart';

class MaterialGrid extends StatefulWidget {
  const MaterialGrid({Key? key}) : super(key: key);

  @override
  _MaterialGridState createState() => _MaterialGridState();
}

class _MaterialGridState extends State<MaterialGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Demo"),
      ),
      body: GridDemo(),
    );
  }
}

class GridDemo extends StatefulWidget {
  const GridDemo({Key? key}) : super(key: key);

  @override
  _GridDemoState createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  List<IconData> _icons = [];

  void _receiveData() {
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {
          _icons.addAll([
            Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access,
            Icons.cake,
            Icons.free_breakfast
          ]);
        }));
  }

  @override
  void initState() {
    super.initState();
    _receiveData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _icons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
            _receiveData();
          }
          return Container(
            color: Colors.blue,
            child: Icon(
              _icons[index],
              color: Colors.white,
            ),
          );
        });
  }
}
