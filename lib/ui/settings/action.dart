import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

enum SettingsAction { changeThemeColor, changeLanguage, changeFontFamily }

class SettingsActionCreator {
  static Action onChangeThemeColor(int color) {
    return Action(SettingsAction.changeThemeColor, payload: color);
  }

  static Action onChangeLanguage(Locale locale) {
    return Action(SettingsAction.changeLanguage, payload: locale);
  }

  static Action onChangeFont(String fontFamily) {
    return Action(SettingsAction.changeFontFamily, payload: fontFamily);
  }
}
