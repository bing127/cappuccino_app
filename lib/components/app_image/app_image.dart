import 'dart:math';

import 'package:cappuccino/components/app_image/retry_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'app_loading_indicator.dart';

class AppImage extends StatefulWidget {
  const AppImage({
    Key? key,
    required this.image,
    this.fit = BoxFit.scaleDown,
    this.alignment = Alignment.center,
    this.duration,
    this.syncDuration,
    this.distractor = false,
    this.progress = false,
    this.color,
    this.scale,
  }) : super(key: key);

  final ImageProvider? image;
  final BoxFit fit;
  final Alignment alignment;
  final Duration? duration;
  final Duration? syncDuration;
  final bool distractor;
  final bool progress;
  final Color? color;
  final double? scale;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  late ImageProvider _displayImage;
  ImageProvider? _sourceImage;

  @override
  void didChangeDependencies() {
    _updateImage();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AppImage oldWidget) {
    _updateImage();
    super.didUpdateWidget(oldWidget);
  }

  void _updateImage() {
    if (widget.image == _sourceImage) return;
    _sourceImage = widget.image;
    _displayImage = _capImageSize(_addRetry(_sourceImage))!;
  }

  @override
  Widget build(BuildContext context) {
    // return ImageFade(
    return OctoImage(
      image: _displayImage,
      fit: widget.fit,
      fadeInDuration: widget.duration,
      fadeOutDuration: widget.syncDuration,
      alignment: widget.alignment,
      progressIndicatorBuilder: (_, progress) {
        if (!widget.distractor && !widget.progress) return const SizedBox();
        double? value;
        var expectedBytes = progress?.expectedTotalBytes;
        if (progress != null && expectedBytes != null) {
          value = progress.cumulativeBytesLoaded / expectedBytes;
        }
        return Center(child: AppLoadingIndicator(value: widget.progress ? value : null, color: widget.color));
      },
      errorBuilder: (_, error, stacktrace) => Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: LayoutBuilder(builder: (_, constraints) {
          double size = min(constraints.biggest.width, constraints.biggest.height);
          if (size < 16) return const SizedBox.shrink();
          return Icon(
            Icons.image_not_supported_outlined,
            color: Colors.white.withOpacity(0.1),
            size: size,
          );
        }),
      ),
    );
  }

  ImageProvider? _addRetry(ImageProvider? image) {
    return image == null ? image : RetryImage(image);
  }

  ImageProvider? _capImageSize(ImageProvider? image) {
    if (image == null || widget.scale == null) return image;
    final MediaQueryData mq = MediaQuery.of(context);
    final Size screenSize = mq.size * mq.devicePixelRatio * widget.scale!;
    return ResizeImage(image, width: screenSize.width.round());
  }
}