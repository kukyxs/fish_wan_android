import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/home_banner.dart';
import 'package:fish_wan_android/global_store/state.dart';
import 'package:fish_wan_android/ui/home/banner_component/state.dart';
import 'package:fish_wan_android/ui/home/drawer_component/state.dart';

class HomeState implements Cloneable<HomeState>, GlobalBaseState {
  int currentPage;
  List<HomeBannerDetail> banners;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  String fontFamily;

  @override
  HomeState clone() {
    return HomeState()
      ..currentPage = currentPage
      ..banners = banners
      ..localization = localization
      ..themeColor = themeColor
      ..fontFamily = fontFamily;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

class HomeBannerConnector extends ConnOp<HomeState, HomeBannerState> with ReselectMixin {
  @override
  HomeBannerState computed(HomeState state) {
    return HomeBannerState()..banners = state.banners;
  }

  @override
  List factors(HomeState state) {
    return state.banners ?? [];
  }
}

class HomeDrawerConnector extends ConnOp<HomeState, HomeDrawerState> with ReselectMixin {
  @override
  HomeDrawerState computed(HomeState state) {
    return HomeDrawerState()
      ..themeColor = state.themeColor
      ..localization = state.localization
      ..fontFamily = state.fontFamily;
  }

  @override
  List factors(HomeState state) {
    return [state.fontFamily, state.localization, state.themeColor];
  }
}
