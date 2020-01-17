import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SettingHeaderState> buildEffect() {
  return combineEffects(<Object, Effect<SettingHeaderState>>{
    SettingHeaderAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SettingHeaderState> ctx) {
}
