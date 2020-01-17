import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/drawer_settings.dart';

class SettingItemState implements Cloneable<SettingItemState> {
  Color themeColor;
  String fontFamily;
  Locale localization;
  DrawerSettingItem item;

  SettingItemState({this.themeColor, this.fontFamily, this.localization, this.item});

  @override
  SettingItemState clone() {
    return SettingItemState()
      ..themeColor = themeColor
      ..fontFamily = fontFamily
      ..localization = localization
      ..item = item;
  }
}

SettingItemState initState(Map<String, dynamic> args) {
  return SettingItemState();
}
