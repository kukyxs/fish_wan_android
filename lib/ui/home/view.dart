import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/article/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_swiper/flutter_swiper.dart' hide ScaleAndFadeTransformer;
import 'package:transformer_page_view/transformer_page_view.dart';

import '../../resource.dart';
import '../transformer.dart';
import 'action.dart';
import 'state.dart';

const _indicator_size = 4.0;

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var _ctx = viewService.context;
  var _size = MediaQuery.of(_ctx).size;

  var _pageChildren = <Widget>[
    HomeArticlePage().buildPage(null),
    HomeArticlePage().buildPage(null),
    HomeArticlePage().buildPage(null),
  ];

  return Theme(
    data: ThemeData(primarySwatch: state.themeColor),
    child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildBanner(_size, state, dispatch),
          Expanded(
            child: TransformerPageView(
              itemCount: _pageChildren.length,
              transformer: ScaleAndFadeTransformer(fade: 0.2, scale: 0.8),
              onPageChanged: (index) {
                dispatch(HomeActionCreator.onPageChange(index));
              },
              itemBuilder: (context, index) => _pageChildren[index],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4.0),
            height: _indicator_size * 2,
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: _buildIndicators(_pageChildren.length, state),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: _generateDrawer(_ctx, state, dispatch),
      ),
      floatingActionButton: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'search',
              // 如果在同个 widget tree 下有多个 FloatingActionButton, 需重写 heroTag
              backgroundColor: state.themeColor,
              mini: true,
              child: Icon(Icons.search),
              onPressed: () {
                dispatch(HomeActionCreator.onOpenSearch());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FloatingActionButton(
                  heroTag: 'setting',
                  backgroundColor: state.themeColor,
                  mini: true,
                  child: Icon(Icons.settings),
                  onPressed: () {
                    dispatch(HomeActionCreator.onOpenDrawer(context));
                  }),
            ),
          ],
        );
      }),
    ),
  );
}

Widget _buildBanner(Size _size, HomeState state, Dispatch dispatch) {
  return Container(
    height: _size.height / 5,
    child: state.banners == null || state.banners.isEmpty
        ? SizedBox()
        : Swiper(
            itemCount: state.banners?.length ?? 0,
            transformer: DeepthPageTransformer(),
            loop: true,
            autoplay: true,
            itemBuilder: (_, index) {
              return GestureDetector(
                child: FadeInImage.assetNetwork(
                  placeholder: ResourceConfigs.pngPlaceholder,
                  image: state.banners[index].imagePath ?? '',
                  width: _size.width,
                  height: _size.height / 5,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  dispatch(HomeActionCreator.onOpenArticleDetail(state.banners[index].url));
                },
              );
            },
          ),
  );
}

List<Widget> _buildIndicators(int length, HomeState state) => List.generate(length, (index) {
      return Container(
        width: _indicator_size,
        height: _indicator_size,
        margin: EdgeInsets.symmetric(horizontal: _indicator_size),
        decoration: BoxDecoration(
          color: state.currentPage == index ? state.themeColor ?? Colors.blue : Colors.grey,
          shape: BoxShape.circle,
        ),
      );
    });

Widget _generateDrawer(BuildContext context, HomeState state, Dispatch dispatch) => ListView(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
      children: <Widget>[
        ListTile(
          title: Text(
            FlutterI18n.translate(context, I18nKeys.settings),
            style: TextStyle(fontSize: SpValues.settingTextSize, fontFamily: state.fontFamily, color: state.themeColor),
          ),
          leading: Icon(
            Icons.settings,
            color: state.themeColor,
          ),
          onTap: () {
            dispatch(HomeActionCreator.onOpenSettings());
          },
        )
      ],
    );
