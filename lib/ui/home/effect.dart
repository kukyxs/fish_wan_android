import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/api.dart';
import 'package:fish_wan_android/ui/route.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _onPageInit,
    HomeAction.openArticleDetail: _onOpenArticleDetail,
    HomeAction.openDrawer: _onOpenDrawer,
    HomeAction.openSearch: _onOpenSearch,
    HomeAction.openSettings: _onOpenSettings,
  });
}

void _onPageInit(Action action, Context<HomeState> ctx) async {
  ctx.dispatch(HomeActionCreator.onPageChange(0));
  var banners = await Api().fetchHomeBanner();
  ctx.dispatch(HomeActionCreator.onFetchBanner(banners));
}

void _onOpenArticleDetail(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).pushNamed(
    RouteConfigs.route_name_article_detail_page,
    arguments: {'url': action.payload},
  );
}

void _onOpenDrawer(Action action, Context<HomeState> ctx) {
  Scaffold.of(action.payload).openDrawer();
}

void _onOpenSearch(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).pushNamed(RouteConfigs.route_name_search);
}

void _onOpenSettings(Action action, Context<HomeState> ctx) {
  Navigator.of(ctx.context).pop();
  Navigator.of(ctx.context).pushNamed(RouteConfigs.route_name_settings);
}
