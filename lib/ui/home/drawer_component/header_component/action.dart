import 'package:fish_redux/fish_redux.dart';

enum SettingHeaderAction { action }

class SettingHeaderActionCreator {
  static Action onAction() {
    return const Action(SettingHeaderAction.action);
  }
}
