import 'package:flutter/material.dart';

typedef FocusCallback = void Function(double isFocus);

class KeyboardEvent extends StatefulWidget {
  final Widget child;
  final FocusCallback callback;
  const KeyboardEvent({super.key, required this.child, required this.callback});

  @override
  State<KeyboardEvent> createState() => _KeyboardEventState();
}

class _KeyboardEventState extends State<KeyboardEvent> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.removeObserver(this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      final double keyboardHeight = EdgeInsets.fromViewPadding(View.of(context).viewInsets, View.of(context).devicePixelRatio).bottom;
      debugPrint("键盘高度变化" + keyboardHeight.toString());
      widget.callback(keyboardHeight);
    });

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

