import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/home/drawer_component/setting_component/component.dart';
import 'package:fish_wan_android/ui/home/drawer_component/state.dart';

class DrawerSettingAdapter extends SourceFlowAdapter<HomeDrawerState> {
  static const settingType = 'setting';

  DrawerSettingAdapter()
      : super(pool: <String, Component<Object>>{
          settingType: SettingItemComponent(),
        });
}
