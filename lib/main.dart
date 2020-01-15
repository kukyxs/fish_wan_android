import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/global_store/store.dart';
import 'package:fish_wan_android/global_store/update.dart';
import 'package:fish_wan_android/ui/arctile_detail/page.dart';
import 'package:fish_wan_android/ui/search/page.dart';
import 'package:fish_wan_android/ui/settings/page.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'global_store/state.dart';
import 'ui/home/page.dart';
import 'ui/route.dart';
import 'ui/splash/page.dart';

class Test {
  String name;
  int age;
  Test(this.name, this.age);
}

void main() {
  runApp(createApp());

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
  }
}

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        RouteConfigs.route_name_splash_page: SplashPage(),
        RouteConfigs.route_name_home_page: HomePage(),
        RouteConfigs.route_name_article_detail_page: ArticleDetailPage(),
        RouteConfigs.route_name_settings: SettingsPage(),
        RouteConfigs.route_name_search: SearchPage(),
      },
      visitor: (String path, Page<Object, dynamic> page) {
        if (page.isTypeof<GlobalBaseState>()) {
          page.connectExtraStore<GlobalState>(GlobalStore.store, globalUpdate());
        }
      });

  return RefreshConfiguration(
    footerTriggerDistance: 15.0,
    dragSpeedRatio: 0.91,
    headerBuilder: () => MaterialClassicHeader(),
    footerBuilder: () => ClassicFooter(),
    autoLoad: true,
    enableLoadingWhenNoData: false,
    shouldFooterFollowWhenNotFull: (state) => false,
    child: MaterialApp(
      title: 'FishWanAndroid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterI18nDelegate()
      ],
      supportedLocales: [Locale('en'), Locale('zh')],
      home: routes.buildPage(RouteConfigs.route_name_splash_page, null),
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(builder: (context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    ),
  );
}
