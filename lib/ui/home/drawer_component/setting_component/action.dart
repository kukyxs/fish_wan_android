import 'package:fish_redux/fish_redux.dart';

enum SettingItemAction { collect, share, todo, settings, about, description, support, loginOut }

class SettingItemActionCreator {
  static Action onCollect() {
    return const Action(SettingItemAction.collect);
  }

  static Action onShare() {
    return const Action(SettingItemAction.share);
  }

  static Action onTodo() {
    return const Action(SettingItemAction.todo);
  }

  static Action onSettings() {
    return const Action(SettingItemAction.settings);
  }

  static Action onAbout() {
    return const Action(SettingItemAction.about);
  }

  static Action onDescription() {
    return const Action(SettingItemAction.description);
  }

  static Action onSupport() {
    return const Action(SettingItemAction.support);
  }

  static Action onLoginOut() {
    return const Action(SettingItemAction.loginOut);
  }
}
