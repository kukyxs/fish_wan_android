import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

class HomeDrawerState implements Cloneable<HomeDrawerState> {
  String fontFamily;

  Locale localization;

  Color themeColor;

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..fontFamily = fontFamily
      ..localization = localization
      ..themeColor = themeColor;
  }
}

HomeDrawerState initState(Map<String, dynamic> args) {
  return HomeDrawerState();
}
