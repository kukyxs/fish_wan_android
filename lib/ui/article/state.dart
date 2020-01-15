import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';

class HomeArticleState implements Cloneable<HomeArticleState>, GlobalBaseState {
  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  String fontFamily;

  @override
  HomeArticleState clone() {
    return HomeArticleState()
      ..localization = localization
      ..themeColor = themeColor
      ..fontFamily = fontFamily;
  }
}

HomeArticleState initState(Map<String, dynamic> args) {
  return HomeArticleState();
}
