import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

class DrawerSettingItem {
  String itemTextKey;
  IconData itemIcon;
  Action action;

  DrawerSettingItem(this.itemTextKey, this.itemIcon, this.action);
}
