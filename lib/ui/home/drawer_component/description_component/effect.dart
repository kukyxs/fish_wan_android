import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DescriptionDialogState> buildEffect() {
  return combineEffects(<Object, Effect<DescriptionDialogState>>{
    DescriptionDialogAction.close: _onClose,
  });
}

void _onClose(Action action, Context<DescriptionDialogState> ctx) {
  Navigator.of(ctx.context).pop();
}
