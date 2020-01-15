import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/article/page.dart';

import 'state.dart';

/// 全局刷新状态
/// 页面状态刷新，在 [createApp()] visitor 中注册
/// 如果是 `PageView` 中的页面做刷新，在 `Page` 构造函数中注册
/// 参考 [HomeArticlePage]
globalUpdate() => (Object pageState, GlobalState appState) {
      final GlobalBaseState p = pageState;

      if (p.themeColor != appState.themeColor && pageState is Cloneable) {
        final Object copy = pageState.clone();
        final GlobalBaseState newState = copy;
        return newState..themeColor = appState.themeColor;
      }

      if (p.localization != appState.localization && pageState is Cloneable) {
        final Object copy = pageState.clone();
        final GlobalBaseState newState = copy;
        return newState..localization = appState.localization;
      }

      return pageState;
    };
