import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SettingHeaderState state, Dispatch dispatch, ViewService viewService) {
  return DrawerHeader(
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: ClipOval(
            child: Container(
              width: 70.0,
              height: 70.0,
              color: state.themeColor,
              alignment: Alignment.center,
              child: Text(
                'K',
                style: TextStyle(fontSize: 32.0, fontFamily: state.fontFamily, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.supervised_user_circle, color: state.themeColor, size: 20.0),
                  ),
                  Text(
                    'Kuky',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16.0, fontFamily: state.fontFamily, color: state.themeColor),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.score, size: 20.0, color: state.themeColor),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '2247',
                        style: TextStyle(fontSize: 16.0, color: state.themeColor, fontFamily: state.fontFamily),
                        children: [
                          TextSpan(text: '\t\t/\t\t', style: TextStyle(fontSize: 16.0, color: Colors.black)),
                          TextSpan(text: 'Lv22', style: TextStyle(fontSize: 16.0, color: Colors.greenAccent, fontFamily: state.fontFamily)),
                          TextSpan(text: '\t\t/\t\t', style: TextStyle(fontSize: 16.0, color: Colors.black)),
                          TextSpan(text: 'R169', style: TextStyle(fontSize: 16.0, color: Colors.pink, fontFamily: state.fontFamily))
                        ],
                      ),
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );}
