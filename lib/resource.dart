import 'package:flutter/material.dart';

class ResourceConfigs {
  static const languageStyles = ['system', 'zh', 'en'];
  static const themeColors = [Colors.blue, Colors.red, Colors.green, Colors.deepOrange, Colors.pink, Colors.purple];

  static const i18nFolder = 'assets/flutter_i18n';

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
}

class SpValues {
  static const titleTextSize = 18.0;
  static const settingTextSize = 16.0;
  static const settingIconSize = 24.0;
}
