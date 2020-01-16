import 'package:flutter/material.dart';

class ResourceConfigs {
  static const languageStyles = ['system', 'zh', 'en'];
  static const themeColors = [Colors.blue, Colors.red, Colors.green, Colors.deepOrange, Colors.pink, Colors.purple];

  static const fontFamilyKaiShu = 'kaishu';

  static const _imageFolder = 'assets/image';
  static const _pngSuffix = 'png';

  static const pngSplash = '$_imageFolder/splash.$_pngSuffix';
  static const pngPlaceholder = '$_imageFolder/placeholder.$_pngSuffix';
}

class I18nKeys {
  static const appName = 'app_name';
  static const detailTitle = 'detail_title';
  static const settings = 'settings';
  static const themeColor = 'theme_color';
  static const language = 'language';
  static const fontFamily = 'font_family';
  static const languageFollowSystem = 'language_follow_system';
  static const languageZh = 'language_zh';
  static const languageEn = 'language_en';
  static const fontFollowSystem = 'font_follow_system';
  static const fontKaiShu = 'font_kai_shu';
  static const search = 'search';
  static const collect = 'collect';
  static const shares = 'shares';
  static const todo = 'todo';
  static const about = 'about';
  static const description = 'description';
  static const support = 'support';
  static const loginOut = 'login_out';
}

class SpValues {
  static const titleTextSize = 20.0;
  static const settingTextSize = 16.0;
  static const settingIconSize = 24.0;
}
