import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/home/drawer_component/adapter.dart';
import 'package:fish_wan_android/ui/home/drawer_component/header_component/state.dart';

import 'setting_component/state.dart';

class HomeDrawerState extends MutableSource implements Cloneable<HomeDrawerState> {
  String fontFamily;

  Locale localization;

  Color themeColor;

  List<SettingItemState> settings;

  @override
  HomeDrawerState clone() {
    return HomeDrawerState()
      ..fontFamily = fontFamily
      ..localization = localization
      ..themeColor = themeColor
      ..settings = settings;
  }

  @override
  Object getItemData(int index) => settings[index];

  @override
  String getItemType(int index) => DrawerSettingAdapter.settingType;

  @override
  int get itemCount => settings?.length ?? 0;

  @override
  void setItemData(int index, Object data) => settings[index] = data;
}

HomeDrawerState initState(Map<String, dynamic> args) {
  return HomeDrawerState();
}

class HeaderConnector extends ConnOp<HomeDrawerState, SettingHeaderState> with ReselectMixin {
  @override
  SettingHeaderState computed(HomeDrawerState state) {
    return SettingHeaderState()
      ..localization = state.localization
      ..fontFamily = state.fontFamily
      ..themeColor = state.themeColor;
  }

  @override
  List factors(HomeDrawerState state) {
    return [state.fontFamily, state.themeColor, state.localization];
  }
}
