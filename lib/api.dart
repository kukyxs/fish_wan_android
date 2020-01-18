import 'package:dio/dio.dart';
import 'package:fish_wan_android/entity/home_banner.dart';

import 'entity/home_article_entitle.dart';
import 'utils/http.dart';

class ApiConfigs {
  static const _baseUrl = 'https://www.wanandroid.com';

  static String homeBanner = '/banner/json';

  static String homeArticle(int page) => '/article/list/$page/json';
}

class Api {
  static DioUtil _http;
  static Api _instance;

  Api._private() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConfigs._baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    _http = DioUtil(options: options);
  }

  factory Api() {
    if (_instance == null) {
      _instance = Api._private();
    }
    return _instance;
  }

  Future<List<HomeBannerDetail>> fetchHomeBanner() async {
    Response response = await _http.request(ApiConfigs.homeBanner);
    HomeBannerEntity entity = HomeBannerEntity.fromJson(response.data);
    return entity.errorCode == 0 ? entity.data : [];
  }

  Future<HomeArticleEntity> fetchHomeArticles(int page) async {
    Response response = await _http.request(ApiConfigs.homeArticle(page));
    return HomeArticleEntity.fromJson(response.data);
  }
}
