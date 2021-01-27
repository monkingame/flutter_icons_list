import 'package:app_flutter_icons/icons_map.dart';
import 'package:flutter/material.dart';

class IconsMapUtil {
  Map<String, IconData> getMapData({bool compact = true}) {
    if (!compact) {
      return Map.from(flutterIconsMapData);
    }

    final keys = flutterIconsMapData.keys.map(
      (ele) => ele
          .replaceAll('_outlined', '')
          .replaceAll('_rounded', '')
          .replaceAll('_sharp', ''),
    );

    final map = Map<String, IconData>();
    keys.forEach((key) {
      if (!map.containsKey(key)) {
        final existKey =
            flutterIconsMapData.containsKey(key) ? key : (key + '_outlined');
        map[key] = flutterIconsMapData[existKey];
      }
    });

    return map;
  }
}
