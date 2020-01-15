import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ArticleItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ArticleItemState>>{
      ArticleItemAction.action: _onAction,
    },
  );
}

ArticleItemState _onAction(ArticleItemState state, Action action) {
  final ArticleItemState newState = state.clone();
  return newState;
}
