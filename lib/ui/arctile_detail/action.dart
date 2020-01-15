import 'package:fish_redux/fish_redux.dart';

enum ArticleDetailAction { action }

class ArticleDetailActionCreator {
  static Action onAction() {
    return const Action(ArticleDetailAction.action);
  }
}
