import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/splash/reducer.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SplashPage extends Page<SplashState, Map<String, dynamic>> {
  SplashPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
        );
}
