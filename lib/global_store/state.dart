import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  set themeColor(Color color);

  Locale get localization;

  set localization(Locale locale);

  String get fontFamily;

  set fontFamily(String fontFamily);
}

class GlobalState implements GlobalBaseState, Cloneable<GlobalState> {
  @override
  Color themeColor;

  @override
  Locale localization;

  @override
  String fontFamily;

  @override
  GlobalState clone() {
    return GlobalState()
      ..fontFamily = fontFamily
      ..localization = localization
      ..themeColor = themeColor;
  }
}
