import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/action.dart';
import 'package:fish_wan_android/global_store/store.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:fish_wan_android/ui/route.dart';
import 'package:fish_wan_android/utils/app_data.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_i18n/flutter_i18n.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _loadDefaultSettings,
    SplashAction.toHome: _onToHome,
  });
}

void _onToHome(Action action, Context<SplashState> ctx) {
  Navigator.of(ctx.context).pushReplacementNamed(RouteConfigs.route_name_home_page);
}

void _loadDefaultSettings(Action action, Context<SplashState> ctx) async {
  var keeper = await AppDataKeeper.keeperInstance();
  var color = ResourceConfigs.themeColors[keeper.obtainThemeColorIndex()];
  var language = ResourceConfigs.languageStyles[keeper.obtainLanguageCode()];
  var fontFamily = keeper.obtainFontFamily();
  var _ctx = ctx.context;
  FlutterI18n.refresh(_ctx, language == 'system' ? Localizations.localeOf(_ctx) : Locale(language));

  GlobalStore.store.dispatch(GlobalActionCreator.onLoadDefault({
    'color': color,
    'language': language,
    'font': fontFamily,
  }));
}
