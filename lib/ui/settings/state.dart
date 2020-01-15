import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';

class SettingsState implements Cloneable<SettingsState>, GlobalBaseState {
  @override
  String fontFamily;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  SettingsState clone() {
    return SettingsState()
      ..fontFamily = fontFamily
      ..themeColor = themeColor
      ..localization = localization;
  }
}

SettingsState initState(Map<String, dynamic> args) {
  return SettingsState();
}
