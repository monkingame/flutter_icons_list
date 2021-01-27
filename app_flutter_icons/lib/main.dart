import 'package:app_flutter_icons/icons_map_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final showButton = false;
  var title = 'Flutter Icons';
  var iconsMap = IconsMapUtil().compact();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(child: _buildIconsList()),
          _buildFilterInput(),
        ],
      ),
      floatingActionButton: showButton
          ? ElevatedButton(
              child: Text('debug'),
              onPressed: () {
                final map = IconsMapUtil().compact();
                print(map.length);
              })
          : null,
    );
  }

  Widget _buildIconsList() {
    final crossCount = 10;
    // final map = IconsMapUtil().compact();

    return GridView.count(
      crossAxisCount: crossCount,
      children: iconsMap.keys
          .map(
            (name) => IconButton(
              icon: Icon(iconsMap[name]),
              onPressed: () {
                setState(() {
                  title = name;
                });
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildFilterInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        // labelText: 'Input Filter',
        hintText: 'Input Filter',
      ),
      maxLength: 10,
      onChanged: (text) {
        // print(value);
        setState(() {
          title = text;
          iconsMap = IconsMapUtil().compact();
          iconsMap.removeWhere((key, value) => !key.contains(text));
        });
      },
    );
  }
}
