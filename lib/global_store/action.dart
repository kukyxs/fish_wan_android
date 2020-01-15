import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor, changeLocale, changeFontFamily, loadDefault }

class GlobalActionCreator {
  static Action onChangeThemeColor(Color themeColor) {
    return Action(GlobalAction.changeThemeColor, payload: themeColor);
  }

  static Action onChangeLocale(Locale localization) {
    return Action(GlobalAction.changeLocale, payload: localization);
  }

  static Action onChangeFontFamily(String fontFamily) {
    return Action(GlobalAction.changeFontFamily, payload: fontFamily);
  }

  static Action onLoadDefault(Map<String, Object> settings) {
    return Action(GlobalAction.loadDefault, payload: settings);
  }
}
