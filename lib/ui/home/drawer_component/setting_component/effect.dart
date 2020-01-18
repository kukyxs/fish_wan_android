import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/route.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SettingItemState> buildEffect() {
  return combineEffects(<Object, Effect<SettingItemState>>{
    SettingItemAction.collect: _onCollect,
    SettingItemAction.share: _onShare,
    SettingItemAction.todo: _onTodo,
    SettingItemAction.settings: _onSettings,
    SettingItemAction.about: _onAbout,
    SettingItemAction.description: _onDescription,
    SettingItemAction.support: _onSupport,
    SettingItemAction.loginOut: _onLogonOut,
  });
}

void _onCollect(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onShare(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onTodo(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onSettings(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
  Navigator.of(ctx.context).pushNamed(RouteConfigs.route_name_settings);
}

void _onAbout(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onDescription(Action action, Context<SettingItemState> ctx) {
  showDialog(
    barrierDismissible: false,
    context: ctx.context,
    builder: (context) => ctx.buildComponent('desc'),
  );
}

void _onSupport(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}

void _onLogonOut(Action action, Context<SettingItemState> ctx) {
  Navigator.of(ctx.context).pop();
}
