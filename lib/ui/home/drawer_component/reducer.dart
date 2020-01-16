import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<HomeDrawerState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeDrawerState>>{},
  );
}

HomeDrawerState _onAction(HomeDrawerState state, Action action) {
  final HomeDrawerState newState = state.clone();
  return newState;
}
