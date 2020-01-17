import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.pageChange: _onPageChange,
      HomeAction.fetchBanner: _onFetchBanner,
      HomeAction.loadSettings: _onLoadSettings,
    },
  );
}

HomeState _onPageChange(HomeState state, Action action) {
  return state.clone()..currentPage = action.payload;
}

HomeState _onFetchBanner(HomeState state, Action action) {
  return state.clone()..banners = action.payload;
}

HomeState _onLoadSettings(HomeState state, Action action) {
  return state.clone()..settings = action.payload;
}
