import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/ui/article/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../transformer.dart';
import 'action.dart';
import 'state.dart';

const _indicator_size = 4.0;

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
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
          // banner slot
          viewService.buildComponent('banner'),
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
      ), // drawer slot
      drawer: viewService.buildComponent('drawer'),
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

/// PageIndicator
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
