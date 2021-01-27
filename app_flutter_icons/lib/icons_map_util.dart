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
    // print(keys.length);
    // keys.forEach((ele) {
    //   print(ele);
    // });
    final map = Map<String, IconData>();
    keys.forEach((key) {
      if (!map.containsKey(key)) {
        map[key] = iconsMap[key];
      }
    });

    return map;
  }
}
