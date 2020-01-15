import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<HomeArticleState> buildEffect() {
  return combineEffects(<Object, Effect<HomeArticleState>>{
    HomeArticleAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeArticleState> ctx) {}
