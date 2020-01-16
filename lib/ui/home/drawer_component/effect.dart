import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import '../../route.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeDrawerState> buildEffect() {
  return combineEffects(<Object, Effect<HomeDrawerState>>{
    HomeDrawerAction.openSettings: _onOpenSettings,
  });
}

void _onOpenSettings(Action action, Context<HomeDrawerState> ctx) {
  Navigator.of(ctx.context).pop();
  Navigator.of(ctx.context).pushNamed(RouteConfigs.route_name_settings);
}
