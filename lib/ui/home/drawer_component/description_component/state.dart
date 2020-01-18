import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

class DescriptionDialogState implements Cloneable<DescriptionDialogState> {
  Color themeColor;
  String fontFamily;
  Locale localization;

  @override
  DescriptionDialogState clone() {
    return DescriptionDialogState()
      ..themeColor = themeColor
      ..fontFamily = fontFamily
      ..localization = localization;
  }
}

DescriptionDialogState initState(Map<String, dynamic> args) {
  return DescriptionDialogState();
}
