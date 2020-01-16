import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/home/banner_component/component.dart';
import 'package:fish_wan_android/ui/home/drawer_component/component.dart';
import 'package:fish_wan_android/ui/widget.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
            adapter: null,
            slots: <String, Dependent<HomeState>>{
              'banner': HomeBannerConnector() + HomeBannerComponent(),
              'drawer': HomeDrawerConnector() + HomeDrawerComponent(),
            },
          ),
          middleware: <Middleware<HomeState>>[],
          wrapper: keepAliveWrapper,
        );
}
