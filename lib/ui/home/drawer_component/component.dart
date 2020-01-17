import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/home/drawer_component/adapter.dart';
import 'package:fish_wan_android/ui/home/drawer_component/header_component/component.dart';

import 'state.dart';
import 'view.dart';

class HomeDrawerComponent extends Component<HomeDrawerState> {
  HomeDrawerComponent()
      : super(
          view: buildView,
          dependencies: Dependencies<HomeDrawerState>(
            adapter: NoneConn<HomeDrawerState>() + DrawerSettingAdapter(),
            slots: <String, Dependent<HomeDrawerState>>{
              'header': HeaderConnector() + SettingHeaderComponent(),
            },
          ),
        );
}
