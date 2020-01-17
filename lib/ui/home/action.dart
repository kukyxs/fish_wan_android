import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/home_banner.dart';
import 'package:flutter/widgets.dart' hide Action;

import 'drawer_component/setting_component/state.dart';

enum HomeAction { pageChange, fetchBanner, loadSettings, openDrawer, openSearch }

class HomeActionCreator {
  static Action onPageChange(int page) {
    return Action(HomeAction.pageChange, payload: page);
  }

  static Action onFetchBanner(List<HomeBannerDetail> banner) {
    return Action(HomeAction.fetchBanner, payload: banner);
  }

  static Action onLoadSettings(List<SettingItemState> settings) {
    return Action(HomeAction.loadSettings, payload: settings);
  }

  static Action onOpenDrawer(BuildContext context) {
    return Action(HomeAction.openDrawer, payload: context);
  }

  static Action onOpenSearch() {
    return const Action(HomeAction.openSearch);
  }
}
