import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/article/article_component/state.dart';

class ArticleAdapter extends DynamicFlowAdapter<ArticleItemState> {
  ArticleAdapter()
      : super(
          pool: <String, Component<Object>>{
          },
          connector: _ArticleConnector(),
          );
}

class _ArticleConnector extends ConnOp<ArticleItemState, List<ItemBean>> {
  @override
  List<ItemBean> get(ArticleItemState state) {
    return <ItemBean>[];
  }

  @override
  void set(ArticleItemState state, List<ItemBean> items) {
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
