import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/home_banner.dart';

class HomeBannerState implements Cloneable<HomeBannerState> {
  List<HomeBannerDetail> banners;

  @override
  HomeBannerState clone() {
    return HomeBannerState()..banners = banners;
  }
}

HomeBannerState initState(Map<String, dynamic> args) {
  return HomeBannerState();
}
