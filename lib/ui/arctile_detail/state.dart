import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailState implements Cloneable<ArticleDetailState>, GlobalBaseState {
  String url;

  @override
  String fontFamily;

  @override
  Locale localization;

  @override
  Color themeColor;

  @override
  ArticleDetailState clone() {
    return ArticleDetailState()
      ..url = url
      ..fontFamily = fontFamily
      ..localization = localization
      ..themeColor = themeColor;
  }
}

ArticleDetailState initState(Map<String, dynamic> args) {
  return ArticleDetailState()..url = args['url'] ?? '';
}
