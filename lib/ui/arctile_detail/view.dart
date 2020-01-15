import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ArticleDetailState state, Dispatch dispatch, ViewService viewService) {
  var _ctx = viewService.context;

  return Theme(
    data: ThemeData(primarySwatch: state.themeColor),
    child: WebviewScaffold(
      url: state.url,
      appBar: AppBar(
        backgroundColor: state.themeColor,
        title: Text(
          FlutterI18n.translate(_ctx, I18nKeys.detailTitle),
          style: TextStyle(fontSize: SpValues.titleTextSize, fontFamily: state.fontFamily),
        ),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
    ),
  );
}
