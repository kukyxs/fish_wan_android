import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeArticleAction { action }

class HomeArticleActionCreator {
  static Action onAction() {
    return const Action(HomeArticleAction.action);
  }
}
