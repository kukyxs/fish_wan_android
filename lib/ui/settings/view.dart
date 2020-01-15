import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:fish_wan_android/utils/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'action.dart';
import 'state.dart';

const _itemHeight = 60.0;

Widget buildView(SettingsState state, Dispatch dispatch, ViewService viewService) {
  var _ctx = viewService.context;
  var _size = MediaQuery.of(_ctx).size;
  int _selectedLanguageIndex = AppDataKeeper.languageIndexTrans(state.localization?.languageCode ?? 'system');

  return Theme(
    data: ThemeData(primarySwatch: state.themeColor),
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterI18n.translate(_ctx, I18nKeys.settings),
          style: TextStyle(fontSize: SpValues.titleTextSize, fontFamily: state.fontFamily),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.color_lens),
            title: Text(
              FlutterI18n.translate(_ctx, I18nKeys.themeColor),
              style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily),
            ),
            children: List.generate(ResourceConfigs.themeColors.length, (index) {
              return GestureDetector(
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeThemeColor(index));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  width: _size.width,
                  height: _itemHeight,
                  color: ResourceConfigs.themeColors[index],
                ),
              );
            }),
          ),
          ExpansionTile(
            leading: Icon(Icons.language),
            title: Text(
              FlutterI18n.translate(_ctx, I18nKeys.language),
              style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily),
            ),
            children: <Widget>[
              ListTile(
                title: Text(FlutterI18n.translate(_ctx, I18nKeys.languageFollowSystem),
                    style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily)),
                trailing: _selectedLanguageIndex == 0 ? Icon(Icons.check, color: state.themeColor) : null,
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeLanguage(Locale('system')));
                },
              ),
              ListTile(
                title: Text(FlutterI18n.translate(_ctx, I18nKeys.languageZh),
                    style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily)),
                trailing: _selectedLanguageIndex == 1 ? Icon(Icons.check, color: state.themeColor) : null,
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeLanguage(Locale('zh')));
                },
              ),
              ListTile(
                title: Text(FlutterI18n.translate(_ctx, I18nKeys.languageEn),
                    style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily)),
                trailing: _selectedLanguageIndex == 2 ? Icon(Icons.check, color: state.themeColor) : null,
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeLanguage(Locale('en')));
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.font_download),
            title: Text(FlutterI18n.translate(_ctx, I18nKeys.fontFamily),
                style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily)),
            children: <Widget>[
              ListTile(
                title: Text(FlutterI18n.translate(_ctx, I18nKeys.fontFollowSystem), style: TextStyle(fontSize: SpValues.settingTextSize)),
                trailing: state.fontFamily == null ? Icon(Icons.check, color: state.themeColor) : null,
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeFont(null));
                },
              ),
              ListTile(
                title: Text(FlutterI18n.translate(_ctx, I18nKeys.fontKaiShu),
                    style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: ResourceConfigs.fontFamilyKaiShu)),
                trailing: state.fontFamily == null ? null : Icon(Icons.check, color: state.themeColor),
                onTap: () {
                  dispatch(SettingsActionCreator.onChangeFont(ResourceConfigs.fontFamilyKaiShu));
                },
              )
            ],
          ),
        ],
      ),
    ),
  );
}
