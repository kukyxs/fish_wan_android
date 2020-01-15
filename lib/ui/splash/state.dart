import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';

class SplashState implements Cloneable<SplashState>, GlobalBaseState {
  @override
  String fontFamily;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  SplashState clone() {
    return SplashState()
      ..fontFamily = fontFamily
      ..themeColor = themeColor
      ..localization = localization;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
