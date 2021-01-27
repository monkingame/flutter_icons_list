import 'package:app_flutter_icons/icons_map.dart';
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
  var title = 'Flutter Icons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildIconsList(),
      floatingActionButton: ElevatedButton(
        child: Text('debug'),
        onPressed: () {
          final _ = IconsMapUtil().compact();
        },
      ),
    );
  }

  Widget _buildIconsList() {
    final crossCount = 10;
    // final map = iconsMap;
    final map = IconsMapUtil().compact();

    return GridView.count(
      crossAxisCount: crossCount,
      children: map.keys
          .map(
            (name) => IconButton(
              icon: Icon(map[name]),
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
