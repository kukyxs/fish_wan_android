import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeBannerComponent extends Component<HomeBannerState> {
  HomeBannerComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeBannerState>(
            adapter: null,
            slots: <String, Dependent<HomeBannerState>>{},
          ),
        );
}
