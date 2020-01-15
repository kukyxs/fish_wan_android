import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/entity/home_article_entitle.dart';

class ArticleItemState implements Cloneable<ArticleItemState> {
  HomeArticleDataDetail detail;

  @override
  ArticleItemState clone() {
    return ArticleItemState()..detail = detail;
  }
}

ArticleItemState initState(Map<String, dynamic> args) {
  return ArticleItemState();
}
