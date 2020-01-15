import 'package:fish_redux/fish_redux.dart';

enum SplashAction { toHome }

class SplashActionCreator {
  static Action onToHome() {
    return const Action(SplashAction.toHome);
  }
}
