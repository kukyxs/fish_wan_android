import 'package:fish_redux/fish_redux.dart';

enum HomeBannerAction { openBannerDetail }

class HomeBannerActionCreator {
  static Action onOpenBannerDetail(String bannerUrl) {
    return Action(HomeBannerAction.openBannerDetail, payload: bannerUrl);
  }
}
