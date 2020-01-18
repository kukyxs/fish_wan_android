import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class DescriptionDialogComponent extends Component<DescriptionDialogState> {
  DescriptionDialogComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
        );
}
