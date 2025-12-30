import 'package:flutter/material.dart';


class CacheWidget extends StatefulWidget {
  final Widget child;
  const CacheWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<CacheWidget> createState() => _CacheWidgetState();
}

class _CacheWidgetState extends State<CacheWidget> with AutomaticKeepAliveClientMixin  {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
