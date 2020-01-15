import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleItemAction { action }

class ArticleItemActionCreator {
  static Action onAction() {
    return const Action(ArticleItemAction.action);
  }
}
