import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DescriptionDialogState state, Dispatch dispatch, ViewService viewService) {
  var _ctx = viewService.context;

  return AlertDialog(
    title: Text(FlutterI18n.translate(_ctx, I18nKeys.operatorDescTitle)),
    titleTextStyle: TextStyle(fontSize: SpValues.dialogTitleTextSize, fontFamily: state.fontFamily, color: state.themeColor),
    content: Text(FlutterI18n.translate(_ctx, I18nKeys.operatorDescContent)),
    contentTextStyle: TextStyle(fontSize: SpValues.dialogContentTextSize, fontFamily: state.fontFamily, color: state.themeColor),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          dispatch(DescriptionDialogActionCreator.onClose());
        },
        child: Text(
          FlutterI18n.translate(_ctx, I18nKeys.dialogPositiveGet),
          style: TextStyle(color: state.themeColor, fontFamily: state.fontFamily),
        ),
      )
    ],
  );
}
