import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ArticleItemState> buildEffect() {
  return combineEffects(<Object, Effect<ArticleItemState>>{
    ArticleItemAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ArticleItemState> ctx) {}
