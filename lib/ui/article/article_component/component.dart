import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ArticleItemComponent extends Component<ArticleItemState> {
  ArticleItemComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ArticleItemState>(
            adapter: null,
            slots: <String, Dependent<ArticleItemState>>{},
          ),
        );
}
