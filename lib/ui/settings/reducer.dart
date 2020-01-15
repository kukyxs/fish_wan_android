import 'package:fish_redux/fish_redux.dart';

import 'state.dart';

Reducer<SettingsState> buildReducer() {
  return asReducer(
    <Object, Reducer<SettingsState>>{},
  );
}
