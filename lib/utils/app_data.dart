import 'package:synchronized/synchronized.dart';

import 'presistence.dart';

const _keyPrefix = 'fish.android.key';
const _keyThemeColor = '$_keyPrefix.theme.color';
const _keyLocale = '$_keyPrefix.locale';
const _keyFontFamily = '$_keyPrefix.font.family';

class AppDataKeeper {
  static AppDataKeeper _instance;
  static ShareUtils _share;
  static Lock _lock = Lock();

  AppDataKeeper._private();

  static Future<AppDataKeeper> keeperInstance() async {
    if (_instance == null) {
      await _lock.synchronized(() async {
        if (_instance == null) {
          var temp = AppDataKeeper._private();
          _share = await ShareUtils.getInstance();
          _instance = temp;
        }
      });
    }
    return _instance;
  }

  //region 全局状态数据保持
  Future<bool> keepThemeColorIndex(int index) => _share.putInt(_keyThemeColor, index);

  int obtainThemeColorIndex() => _share.getInt(_keyThemeColor, def: 0);

  Future<bool> keepLanguageIndex(int index) => _share.putInt(_keyLocale, index);

  int obtainLanguageCode() => _share.getInt(_keyLocale, def: 0);

  Future<bool> keepFontFamily(String fontFamily) => _share.putString(_keyFontFamily, fontFamily);

  String obtainFontFamily() => _share.getString(_keyFontFamily, def: null);
//endregion

}
