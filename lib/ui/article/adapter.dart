import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/article/article_component/component.dart';
import 'package:fish_wan_android/ui/article/state.dart';

class ArticleAdapter extends SourceFlowAdapter<HomeArticleState> {
  static const typeArticle = 'article';

  ArticleAdapter()
      : super(
          pool: <String, Component<Object>>{
            typeArticle: ArticleItemComponent(),
          },
        );
}
