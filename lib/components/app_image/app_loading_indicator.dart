import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({Key? key, this.value, this.color}) : super(key: key);
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final progress = (value == null || value! < .05) ? null : value;

    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        color: color,
        value: progress,
        strokeWidth: 1.0,
      ),
    );
  }
}
