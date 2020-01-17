import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SettingItemComponent extends Component<SettingItemState> {
  SettingItemComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
