import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../resource.dart';
import '../../transformer.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeBannerState state, Dispatch dispatch, ViewService viewService) {
  var _size = MediaQuery.of(viewService.context).size;

  return Container(
    height: _size.height / 5,
    child: state.banners == null || state.banners.isEmpty
        ? SizedBox()
        : Swiper(
            itemCount: state.banners.length,
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
                  dispatch(HomeBannerActionCreator.onOpenBannerDetail(state.banners[index].url));
                },
              );
            },
          ),
  );
}
