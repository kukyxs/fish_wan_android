import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/action.dart';
import 'state.dart';
import 'dart:ui';

Reducer<GlobalState> buildReducer() {
  return asReducer(<Object, Reducer<GlobalState>>{
    GlobalAction.changeThemeColor: _onThemeChange,
    GlobalAction.changeLocale: _onLocalChange,
    GlobalAction.changeFontFamily: _onFontFamilyChange,
    GlobalAction.loadDefault: _onLoadSettings,
  });
}

GlobalState _onThemeChange(GlobalState state, Action action) {
  return state.clone()..themeColor = action.payload;
}

GlobalState _onLocalChange(GlobalState state, Action action) {
  return state.clone()..localization = action.payload;
}

GlobalState _onFontFamilyChange(GlobalState state, Action action) {
  return state.clone()..fontFamily = action.payload;
}

GlobalState _onLoadSettings(GlobalState state, Action action) {
  var payload = action.payload as Map;

  return state.clone()
    ..themeColor = payload['color']
    ..fontFamily = payload['font']
    ..localization = Locale(payload['language']);
}
