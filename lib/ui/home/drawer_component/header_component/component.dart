import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SettingHeaderComponent extends Component<SettingHeaderState> {
  SettingHeaderComponent()
      : super(
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<SettingHeaderState>(
                adapter: null,
                slots: <String, Dependent<SettingHeaderState>>{
                }),);

}
