import 'package:fish_redux/fish_redux.dart';

import '../../route.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeBannerState> buildEffect() {
  return combineEffects(<Object, Effect<HomeBannerState>>{
    HomeBannerAction.openBannerDetail: _onOpenBannerDetail,
  });
}

void _onOpenBannerDetail(Action action, Context<HomeBannerState> ctx) {
  RouteConfigs.openWebDetail(ctx.context, action.payload);
}
