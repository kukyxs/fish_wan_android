import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';

class SearchState implements Cloneable<SearchState>, GlobalBaseState {
  @override
  String fontFamily;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  SearchState clone() {
    return SearchState()
      ..fontFamily = fontFamily
      ..themeColor = themeColor
      ..localization = localization;
  }
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState();
}
