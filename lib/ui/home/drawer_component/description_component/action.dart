import 'package:fish_redux/fish_redux.dart';

enum DescriptionDialogAction { close }

class DescriptionDialogActionCreator {
  static Action onClose() {
    return const Action(DescriptionDialogAction.close);
  }
}
