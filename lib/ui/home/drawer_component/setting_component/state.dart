import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/drawer_settings.dart';
import 'package:fish_wan_android/ui/home/drawer_component/description_component/state.dart';
import 'package:flutter/material.dart';

class SettingItemState implements Cloneable<SettingItemState> {
  Color themeColor;
  String fontFamily;
  Locale localization;
  DrawerSettingItem item;

  SettingItemState({this.themeColor, this.fontFamily, this.localization, this.item});

  @override
  SettingItemState clone() {
    return SettingItemState()
      ..themeColor = themeColor
      ..fontFamily = fontFamily
      ..localization = localization
      ..item = item;
  }
}

SettingItemState initState(Map<String, dynamic> args) {
  return SettingItemState();
}

class DescriptionDialogConnector extends ConnOp<SettingItemState, DescriptionDialogState> with ReselectMixin {
  @override
  DescriptionDialogState computed(SettingItemState state) {
    return DescriptionDialogState()
      ..localization = state.localization
      ..themeColor = state.themeColor
      ..fontFamily = state.fontFamily;
  }

  @override
  List factors(SettingItemState state) {
    return [state.localization, state.fontFamily, state.themeColor];
  }
}
