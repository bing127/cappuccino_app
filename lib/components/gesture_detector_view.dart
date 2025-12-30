import 'package:flutter/material.dart';

class GestureDetectorView extends StatelessWidget {
  final Widget child;
  final void Function()? callback;
  const GestureDetectorView({super.key, required this.child, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          unFocusScope(context);
        },
        onHorizontalDragStart: (DragStartDetails details) {
          unFocusScope(context);
        },
        onVerticalDragStart: (DragStartDetails details) {
          unFocusScope(context);
        },
        child: child,
    );
  }

  void unFocusScope(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus &&
        currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    if(callback != null) {
      callback!();
    }
  }
}

