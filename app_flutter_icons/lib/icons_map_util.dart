import 'package:app_flutter_icons/icons_map.dart';
import 'package:flutter/material.dart';

class IconsMapUtil {
  Map<String, IconData> compact() {
    // final keys = iconsMap.keys;
    final keys = iconsMap.keys.map(
      (ele) => ele
          .replaceAll('_outlined', '')
          .replaceAll('_rounded', '')
          .replaceAll('_sharp', ''),
    );

    final map = Map<String, IconData>();
    keys.forEach((key) {
      if (!map.containsKey(key)) {
        final existKey = iconsMap.containsKey(key) ? key : (key + '_outlined');
        map[key] = iconsMap[existKey];
      }
    });

    return map;
  }
}
