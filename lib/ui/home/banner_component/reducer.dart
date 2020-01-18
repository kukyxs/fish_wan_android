import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<HomeBannerState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeBannerState>>{},
  );
}

// ignore: unused_element
HomeBannerState _onAction(HomeBannerState state, Action action) {
  final HomeBannerState newState = state.clone();
  return newState;
}
