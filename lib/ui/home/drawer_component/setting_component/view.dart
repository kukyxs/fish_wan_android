import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'state.dart';

Widget buildView(SettingItemState state, Dispatch dispatch, ViewService viewService) {
  return ListTile(
    leading: Icon(state.item.itemIcon, color: state.themeColor),
    title: Text(
      FlutterI18n.translate(viewService.context, state.item.itemTextKey),
      style: TextStyle(
        fontSize: SpValues.settingTextSize,
        fontFamily: state.fontFamily,
        color: state.themeColor,
      ),
    ),
    onTap: () => dispatch(state.item.action),
  );
}
