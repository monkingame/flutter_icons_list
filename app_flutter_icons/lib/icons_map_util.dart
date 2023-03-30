import 'package:app_flutter_icons/icons_map.dart';
import 'package:flutter/material.dart';

class IconsMapUtil {
  Map<String, IconData> getMapData({bool compact = true}) {
    if (!compact) {
      return Map.from(flutterIconsMapData);
    }

    final keys = flutterIconsMapData.keys.map(
      (e) => e
          .replaceAll('_outlined', '')
          .replaceAll('_rounded', '')
          .replaceAll('_sharp', ''),
    );

    final pureMap = Map<String, IconData>();
    keys.forEach((key) {
      if (!pureMap.containsKey(key)) {
        final existKey =
            flutterIconsMapData.containsKey(key) ? key : (key + '_outlined');
        final value = flutterIconsMapData[existKey];
        if (value != null) {
          pureMap[key] = value;
        }
      }
    });

    return pureMap;
  }
}
