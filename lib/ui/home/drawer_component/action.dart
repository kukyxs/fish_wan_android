import 'package:fish_redux/fish_redux.dart';

enum HomeDrawerAction { openSettings }

class HomeDrawerActionCreator {
  static Action onOpenSettings() {
    return const Action(HomeDrawerAction.openSettings);
  }
}
