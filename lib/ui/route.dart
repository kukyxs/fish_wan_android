import 'package:flutter/cupertino.dart';

class RouteConfigs {
  static const route_name_splash_page = 'splash';
  static const route_name_home_page = 'home';
  static const route_name_article_detail_page = 'article_detail';
  static const route_name_settings = 'settings';
  static const route_name_search = 'search';

  static void openWebDetail(BuildContext context, String url) {
    Navigator.of(context).pushNamed(route_name_article_detail_page, arguments: {'url': url});
  }
}
