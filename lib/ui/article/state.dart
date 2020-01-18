import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';
import 'package:fish_wan_android/ui/article/adapter.dart';
import 'package:fish_wan_android/ui/article/article_component/state.dart';

class HomeArticleState extends MutableSource implements Cloneable<HomeArticleState>, GlobalBaseState {
  List<ArticleItemState> items;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  String fontFamily;

  @override
  HomeArticleState clone() {
    return HomeArticleState()
      ..items = items
      ..localization = localization
      ..themeColor = themeColor
      ..fontFamily = fontFamily;
  }

  @override
  Object getItemData(int index) {
    return items[index];
  }

  @override
  String getItemType(int index) {
    return ArticleAdapter.typeArticle;
  }

  @override
  int get itemCount => items?.length ?? 0;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

HomeArticleState initState(Map<String, dynamic> args) {
  return HomeArticleState();
}
