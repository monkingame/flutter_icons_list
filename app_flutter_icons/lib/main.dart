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
  double lineCount = 8;
  bool compact = true;
  var iconsMap = IconsMapUtil().getMapData(compact: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          _buildLayoutCtrlBar(),
          Expanded(child: _buildIconsList()),
          _buildFilterInput(),
        ],
      ),
      floatingActionButton: showButton
          ? ElevatedButton(
              child: Text('debug'),
              onPressed: () {
                final map = IconsMapUtil().getMapData();
                print(map.length);
              })
          : null,
    );
  }

  Widget _buildIconsList() {
    return GridView.count(
      crossAxisCount: lineCount.round(),
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

  Widget _buildLayoutCtrlBar() {
    return Row(
      children: [
        Switch(
          value: compact,
          onChanged: (value) {
            setState(() {
              compact = !compact;
              // iconsMap = _getIconsMap;
              iconsMap = IconsMapUtil().getMapData(compact: compact);
            });
          },
        ),
        Text('Compact'),
        // VerticalDivider(color: Colors.red),
        Expanded(
          child: Slider(
            min: 4,
            max: 12,
            divisions: 8,
            label: lineCount.round().toString(),
            value: lineCount,
            onChanged: (value) {
              setState(() {
                lineCount = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterInput() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input Filter',
      ),
      maxLength: 10,
      onChanged: (v) {
        final text = v.trim();
        setState(() {
          title = text;
          // iconsMap = _getIconsMap;
          iconsMap = IconsMapUtil().getMapData(compact: compact);
          if (text.isEmpty) return;

          iconsMap.removeWhere((key, value) => !key.contains(text));
        });
      },
    );
  }

  // Map<String, IconData> get _getIconsMap =>
  //     compact ? IconsMapUtil().getMapData() : flutterIconsMapData;
}
