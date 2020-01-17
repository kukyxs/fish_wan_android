import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

class SettingHeaderState implements Cloneable<SettingHeaderState> {
  Color themeColor;
  String fontFamily;
  Locale localization;

  @override
  SettingHeaderState clone() {
    return SettingHeaderState()
      ..themeColor = themeColor
      ..fontFamily = fontFamily
      ..localization = localization;
  }
}

SettingHeaderState initState(Map<String, dynamic> args) {
  return SettingHeaderState();
}
