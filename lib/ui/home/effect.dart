import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/api.dart';
import 'package:fish_wan_android/entity/drawer_settings.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:fish_wan_android/ui/home/drawer_component/setting_component/action.dart';
import 'package:fish_wan_android/ui/home/drawer_component/setting_component/state.dart';
import 'package:fish_wan_android/ui/route.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

/// SettingItemList
const _keys = <String>[
  I18nKeys.collect,
  I18nKeys.shares,
  I18nKeys.todo,
  I18nKeys.settings,
  I18nKeys.about,
  I18nKeys.description,
  I18nKeys.support,
  I18nKeys.loginOut,
];

const _icons = <IconData>[
  Icons.favorite_border,
  Icons.share,
  Icons.today,
  Icons.settings,
  Icons.error_outline,
  Icons.description,
  Icons.star_border,
  Icons.label_outline,
];

List _actions = <Action>[
  SettingItemActionCreator.onCollect(),
  SettingItemActionCreator.onShare(),
  SettingItemActionCreator.onTodo(),
  SettingItemActionCreator.onSettings(),
  SettingItemActionCreator.onAbout(),
  SettingItemActionCreator.onDescription(),
  SettingItemActionCreator.onSupport(),
  SettingItemActionCreator.onLoginOut(),
];

///
Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onPageInit,
    HomeAction.openDrawer: _onOpenDrawer,
    HomeAction.openSearch: _onOpenSearch,
    Lifecycle.didUpdateWidget: _loadSettingItems,
  });
}

void _onPageInit(Action action, Context<HomeState> ctx) async {
  _loadSettingItems(action, ctx);
  ctx.dispatch(HomeActionCreator.onPageChange(0));
  var banners = await Api().fetchHomeBanner();
  ctx.dispatch(HomeActionCreator.onFetchBanner(banners));
}

/// generate settings, update in initState && didUpdateWidget
void _loadSettingItems(Action action, Context<HomeState> ctx) {
  var settings = List.generate(_keys.length, (index) {
    return _generateItemState(ctx, _keys[index], _icons[index], _actions[index]);
  });

  ctx.dispatch(HomeActionCreator.onLoadSettings(settings));
}

SettingItemState _generateItemState(Context<HomeState> ctx, String key, IconData icon, Action action) => SettingItemState(
      themeColor: ctx.state.themeColor,
      fontFamily: ctx.state.fontFamily,
      localization: ctx.state.localization,
      item: DrawerSettingItem(key, icon, action),
    );

void _onOpenDrawer(Action action, Context<HomeState> ctx) {
  Scaffold.of(action.payload).openDrawer();
}

void _onOpenSearch(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).pushNamed(RouteConfigs.route_name_search);
}
