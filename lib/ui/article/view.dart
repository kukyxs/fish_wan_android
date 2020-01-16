import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(HomeArticleState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 4.0),
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      color: state.themeColor ?? Colors.blue,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Home',
          style: TextStyle(fontSize: 20.0, color: Colors.white, fontFamily: state.fontFamily),
        ),
      ),
    ),
  );
}
