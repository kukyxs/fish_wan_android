import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/home/drawer_component/description_component/component.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SettingItemComponent extends Component<SettingItemState> {
  SettingItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<SettingItemState>(
            adapter: null,
            slots: <String, Dependent<SettingItemState>>{
              "desc": DescriptionDialogConnector() + DescriptionDialogComponent(),
            },
          ),
        );
}
