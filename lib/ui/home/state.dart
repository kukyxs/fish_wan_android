import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/home_banner.dart';
import 'package:fish_wan_android/global_store/state.dart';

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
