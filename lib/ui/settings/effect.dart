import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/application.dart';
import 'package:fish_wan_android/global_store/action.dart';
import 'package:fish_wan_android/global_store/store.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:fish_wan_android/utils/app_data.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_i18n/flutter_i18n.dart';

import 'action.dart';
import 'state.dart';

Effect<SettingsState> buildEffect() {
  return combineEffects(<Object, Effect<SettingsState>>{
    SettingsAction.changeThemeColor: _onChangeThemeColor,
    SettingsAction.changeLanguage: _onChangeLanguage,
    SettingsAction.changeFontFamily: _onChangeFontFamily,
  });
}

void _onChangeThemeColor(Action action, Context<SettingsState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor(ResourceConfigs.themeColors[action.payload]));
  Application.dataKeeper.keepThemeColorIndex(action.payload);
}

void _onChangeLanguage(Action action, Context<SettingsState> ctx) {
  Locale locale = action.payload;
  var _ctx = ctx.context;

  GlobalStore.store.dispatch(GlobalActionCreator.onChangeLocale(locale));
  FlutterI18n.refresh(_ctx, locale.languageCode == 'system' ? Localizations.localeOf(_ctx) : locale);
  Application.dataKeeper.keepLanguageIndex(AppDataKeeper.languageIndexTrans(locale.languageCode));
}

void _onChangeFontFamily(Action action, Context<SettingsState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeFontFamily(action.payload));
  Application.dataKeeper.keepFontFamily(action.payload);
}
