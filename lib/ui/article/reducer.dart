import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeArticleState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeArticleState>>{
      HomeArticleAction.action: _onAction,
    },
  );
}

HomeArticleState _onAction(HomeArticleState state, Action action) {
  final HomeArticleState newState = state.clone();
  return newState;
}
