import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(HomeDrawerState state, Dispatch dispatch, ViewService viewService) {
  return Drawer(
    child: Column(
      children: <Widget>[
        viewService.buildComponent('header'),
        Expanded(
          child: ListView.builder(
            itemBuilder: viewService.buildAdapter().itemBuilder,
            itemCount: viewService.buildAdapter().itemCount,
          ),
        )
      ],
    ),
  );
}
