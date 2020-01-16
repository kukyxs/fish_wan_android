import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeDrawerComponent extends Component<HomeDrawerState> {
  HomeDrawerComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeDrawerState>(
            adapter: null,
            slots: <String, Dependent<HomeDrawerState>>{},
          ),
        );
}
