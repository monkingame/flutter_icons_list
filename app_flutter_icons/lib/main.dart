import 'package:app_flutter_icons/icons_map.dart';
import 'package:app_flutter_icons/map_util.dart';
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
  var title = 'Flutter Icons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildIconsList(),
      floatingActionButton: TextButton(
        child: Text('debug'),
        onPressed: () {
          final _ = IconsMapUtil().compact();
        },
      ),
    );
  }

  Widget _buildIconsList() {
    return GridView.count(
      crossAxisCount: 10,
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
}
