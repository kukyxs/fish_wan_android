import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/state.dart';
import 'package:fish_wan_android/global_store/store.dart';
import 'package:fish_wan_android/global_store/update.dart';
import 'package:fish_wan_android/ui/article/adapter.dart';
import 'package:fish_wan_android/ui/widget.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomeArticlePage extends Page<HomeArticleState, Map<String, dynamic>> with KeepAliveMixin {
  HomeArticlePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeArticleState>(
            adapter: NoneConn<HomeArticleState>() + ArticleAdapter(),
            slots: <String, Dependent<HomeArticleState>>{},
          ),
          wrapper: keepAliveWrapper,
        ) {
    connectExtraStore<GlobalState>(GlobalStore.store, globalUpdate());
  }
}
