import 'package:fish_redux/fish_redux.dart';
import 'package:fish_wan_android/resource.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  Future.delayed(Duration(milliseconds: 3000)).then((value) {
    dispatch(SplashActionCreator.onToHome());
  });

  return Scaffold(
    body: Image.asset(
      ResourceConfigs.pngSplash,
      width: MediaQuery.of(viewService.context).size.width,
      height: MediaQuery.of(viewService.context).size.height,
      fit: BoxFit.fill,
    ),
  );
}
