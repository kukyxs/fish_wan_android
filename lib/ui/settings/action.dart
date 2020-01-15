import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SettingsAction { action }

class SettingsActionCreator {
  static Action onAction() {
    return const Action(SettingsAction.action);
  }
}
