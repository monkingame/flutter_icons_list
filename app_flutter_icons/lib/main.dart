import 'package:app_flutter_icons/icons_map_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _showButton = false;
  var _title = 'Flutter Icons';
  String _filter = '';
  double _lineCount = 8;
  bool _compact = true;
  var _iconsMap = IconsMapUtil().getMapData(compact: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Column(
        children: [
          _buildLayoutCtrlBar(),
          Expanded(child: _buildIconsList()),
          _buildFilterInput(),
        ],
      ),
      floatingActionButton: _showButton
          ? ElevatedButton(
              child: Text('debug'),
              onPressed: () {
                final map = IconsMapUtil().getMapData(compact: _compact);
                print(map.length);
              })
          : null,
    );
  }

  Widget _buildIconsList() {
    return GridView.count(
      crossAxisCount: _lineCount.round(),
      children: _iconsMap.keys
          .map((name) => IconButton(
              icon: Icon(_iconsMap[name]),
              onPressed: () {
                setState(() => _title = name);
                Clipboard.setData(ClipboardData(text: name));
              }))
          .toList(),
    );
  }

  Widget _buildLayoutCtrlBar() {
    return Row(
      children: [
        Text('Compact'),
        Switch(
          value: _compact,
          onChanged: (value) {
            setState(() {
              _compact = !_compact;
              _iconsMap = IconsMapUtil().getMapData(compact: _compact);
              if (_filter.isNotEmpty) {
                _iconsMap.removeWhere((key, value) => !key.contains(_filter));
              }
            });
          },
        ),
        Expanded(
          child: Slider(
            min: 4,
            max: 20,
            divisions: 16,
            label: _lineCount.round().toString(),
            value: _lineCount,
            onChanged: (value) => setState(() => _lineCount = value),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterInput() {
    return Row(
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input Filter',
              labelText: '',
              counterText: '',
            ),
            maxLength: 20,
            onChanged: (v) {
              setState(() {
                _filter = v.toLowerCase().trim();
                _title = _filter;
                _iconsMap = IconsMapUtil().getMapData(compact: _compact);
                if (_filter.isEmpty) return;
                _iconsMap.removeWhere((key, value) => !key.contains(_filter));
              });
            },
          ),
        ),
      ],
    );
  }
}
