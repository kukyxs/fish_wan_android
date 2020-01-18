import 'package:flutter/widgets.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  KeepAliveWidget(this.child);

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) { // ignore: must_call_super
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

Widget keepAliveWrapper(Widget child) => KeepAliveWidget(child);
