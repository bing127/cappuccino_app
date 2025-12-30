import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Duration _bottomSheetEnterDuration = Duration(milliseconds: 250);
const Duration _bottomSheetExitDuration = Duration(milliseconds: 200);
const Curve _modalBottomSheetCurve = decelerateEasing;
const double _minFlingVelocity = 700.0;
const double _closeProgressThreshold = 0.5;

typedef BottomSheetDragStartHandler = void Function(DragStartDetails details);
typedef BottomSheetDragEndHandler = void Function(
    DragEndDetails details, {
    required bool isClosing,
    });
typedef BottomSheetDragUpdateHandler = void Function(DragUpdateDetails details);

class BottomSheet extends StatefulWidget {
  const BottomSheet({
    super.key,
    this.animationController,
    this.enableDrag = true,
    this.showDragHandle,
    this.dragHandleColor,
    this.dragHandleSize,
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    required this.onClosing,
    required this.builder,
  }) : assert(elevation == null || elevation >= 0.0);
  final AnimationController? animationController;
  final VoidCallback onClosing;
  final WidgetBuilder builder;
  final bool enableDrag;
  final bool? showDragHandle;
  final Color? dragHandleColor;
  final Size? dragHandleSize;
  final BottomSheetDragStartHandler? onDragStart;
  final BottomSheetDragEndHandler? onDragEnd;
  final BottomSheetDragUpdateHandler? onDragUpdate;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;

  @override
  State<BottomSheet> createState() => _BottomSheetState();
  static AnimationController createAnimationController(TickerProvider vsync) {
    return AnimationController(
      duration: _bottomSheetEnterDuration,
      reverseDuration: _bottomSheetExitDuration,
      debugLabel: 'BottomSheet',
      vsync: vsync,
    );
  }
}

class _BottomSheetState extends State<BottomSheet> {

  final GlobalKey _childKey = GlobalKey(debugLabel: 'BottomSheet child');

  double get _childHeight {
    final RenderBox renderBox = _childKey.currentContext!.findRenderObject()! as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway => widget.animationController!.status == AnimationStatus.reverse;

  Set<MaterialState> dragHandleMaterialState = <MaterialState>{};

  void _handleDragStart(DragStartDetails details) {
    setState(() {
      dragHandleMaterialState.add(MaterialState.dragged);
    });
    widget.onDragStart?.call(details);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    assert(
    (widget.enableDrag || (widget.showDragHandle?? false)) && widget.animationController != null,
    "'BottomSheet.animationController' cannot be null when 'BottomSheet.enableDrag' or 'BottomSheet.showDragHandle' is true. "
        "Use 'BottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    widget.animationController!.value -= details.primaryDelta! / _childHeight;
    widget.onDragUpdate?.call(details);
  }

  void _handleDragEnd(DragEndDetails details) {
    assert(
    (widget.enableDrag || (widget.showDragHandle?? false)) && widget.animationController != null,
    "'BottomSheet.animationController' cannot be null when 'BottomSheet.enableDrag' or 'BottomSheet.showDragHandle' is true. "
        "Use 'BottomSheet.createAnimationController' to create one, or provide another AnimationController.",
    );
    if (_dismissUnderway) {
      return;
    }
    setState(() {
      dragHandleMaterialState.remove(MaterialState.dragged);
    });
    bool isClosing = false;
    if (details.velocity.pixelsPerSecond.dy > _minFlingVelocity) {
      final double flingVelocity = -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (widget.animationController!.value > 0.0) {
        widget.animationController!.fling(velocity: flingVelocity);
      }
      if (flingVelocity < 0.0) {
        isClosing = true;
      }
    } else if (widget.animationController!.value < _closeProgressThreshold) {
      if (widget.animationController!.value > 0.0) {
        widget.animationController!.fling(velocity: -1.0);
      }
      isClosing = true;
    } else {
      widget.animationController!.forward();
    }

    widget.onDragEnd?.call(
      details,
      isClosing: isClosing,
    );

    if (isClosing) {
      widget.onClosing();
    }
  }

  bool extentChanged(DraggableScrollableNotification notification) {
    if (notification.extent == notification.minExtent && notification.shouldCloseOnMinExtent) {
      widget.onClosing();
    }
    return false;
  }

  void _handleDragHandleHover(bool hovering) {
    if (hovering != dragHandleMaterialState.contains(MaterialState.hovered)) {
      setState(() {
        if (hovering){
          dragHandleMaterialState.add(MaterialState.hovered);
        }
        else{
          dragHandleMaterialState.remove(MaterialState.hovered);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme = Theme.of(context).bottomSheetTheme;
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final BottomSheetThemeData defaults = useMaterial3 ? _BottomSheetDefaultsM3(context) : const BottomSheetThemeData();
    final BoxConstraints? constraints = widget.constraints ?? bottomSheetTheme.constraints ?? defaults.constraints;
    final Color? color = widget.backgroundColor ?? bottomSheetTheme.backgroundColor ?? defaults.backgroundColor;
    final Color? surfaceTintColor = bottomSheetTheme.surfaceTintColor ?? defaults.surfaceTintColor;
    final Color? shadowColor = widget.shadowColor ?? bottomSheetTheme.shadowColor ?? defaults.shadowColor;
    final double elevation = widget.elevation ?? bottomSheetTheme.elevation ?? defaults.elevation ?? 0;
    final ShapeBorder? shape = widget.shape ?? bottomSheetTheme.shape ?? defaults.shape;
    final Clip clipBehavior = widget.clipBehavior ?? bottomSheetTheme.clipBehavior ?? Clip.none;
    final bool showDragHandle = widget.showDragHandle ?? (widget.enableDrag && (bottomSheetTheme.showDragHandle ?? false));

    Widget? dragHandle;
    if (showDragHandle){
      dragHandle = _DragHandle(
        onSemanticsTap: widget.onClosing,
        handleHover: _handleDragHandleHover,
        materialState: dragHandleMaterialState,
        dragHandleColor: widget.dragHandleColor,
        dragHandleSize: widget.dragHandleSize,
      );
      if (!widget.enableDrag) {
        dragHandle = _BottomSheetGestureDetector(
          onVerticalDragStart: _handleDragStart,
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child: dragHandle,
        );
      }
    }

    Widget bottomSheet = Material(
      key: _childKey,
      color: color,
      elevation: elevation,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      shape: shape,
      clipBehavior: clipBehavior,
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: extentChanged,
        child: !showDragHandle
            ? widget.builder(context)
            : Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            dragHandle!,
            Padding(
              padding: const EdgeInsets.only(top: kMinInteractiveDimension),
              child: widget.builder(context),
            ),
          ],
        ),
      ),
    );

    if (constraints != null) {
      bottomSheet = Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1.0,
        child: ConstrainedBox(
          constraints: constraints,
          child: bottomSheet,
        ),
      );
    }

    return !widget.enableDrag ? bottomSheet : _BottomSheetGestureDetector(
      onVerticalDragStart: _handleDragStart,
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: bottomSheet,
    );
  }
}
typedef _SizeChangeCallback<Size> = void Function(Size);

class _DragHandle extends StatelessWidget {
  const _DragHandle({
    required this.onSemanticsTap,
    required this.handleHover,
    required this.materialState,
    this.dragHandleColor,
    this.dragHandleSize,
  });

  final VoidCallback? onSemanticsTap;
  final Function(bool) handleHover;
  final Set<MaterialState> materialState;
  final Color? dragHandleColor;
  final Size? dragHandleSize;

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme = Theme.of(context).bottomSheetTheme;
    final BottomSheetThemeData m3Defaults = _BottomSheetDefaultsM3(context);
    final Size handleSize = dragHandleSize ?? bottomSheetTheme.dragHandleSize ?? m3Defaults.dragHandleSize!;

    return MouseRegion(
      onEnter: (PointerEnterEvent event) => handleHover(true),
      onExit: (PointerExitEvent event) => handleHover(false),
      child: Semantics(
        label: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        container: true,
        onTap: onSemanticsTap,
        child: SizedBox(
          height: kMinInteractiveDimension,
          width: kMinInteractiveDimension,
          child: Center(
            child: Container(
              height: handleSize.height,
              width: handleSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(handleSize.height/2),
                color: MaterialStateProperty.resolveAs<Color?>(dragHandleColor, materialState)
                    ?? MaterialStateProperty.resolveAs<Color?>(bottomSheetTheme.dragHandleColor, materialState)
                    ?? m3Defaults.dragHandleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheetLayoutWithSizeListener extends SingleChildRenderObjectWidget {

  const _BottomSheetLayoutWithSizeListener({
    required this.animationValue,
    required this.isScrollControlled,
    required this.onChildSizeChanged,
    super.child,
  });

  final double animationValue;
  final bool isScrollControlled;
  final _SizeChangeCallback<Size> onChildSizeChanged;

  @override
  _RenderBottomSheetLayoutWithSizeListener createRenderObject(BuildContext context) {
    return _RenderBottomSheetLayoutWithSizeListener(
      animationValue: animationValue,
      isScrollControlled: isScrollControlled,
      onChildSizeChanged: onChildSizeChanged,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderBottomSheetLayoutWithSizeListener renderObject) {
    renderObject.onChildSizeChanged = onChildSizeChanged;
    renderObject.animationValue = animationValue;
    renderObject.isScrollControlled = isScrollControlled;
  }
}

class _RenderBottomSheetLayoutWithSizeListener extends RenderShiftedBox {
  _RenderBottomSheetLayoutWithSizeListener({
    RenderBox? child,
    required _SizeChangeCallback<Size> onChildSizeChanged,
    required double animationValue,
    required bool isScrollControlled,
  }) : _animationValue = animationValue,
        _isScrollControlled = isScrollControlled,
        _onChildSizeChanged = onChildSizeChanged,
        super(child);

  Size _lastSize = Size.zero;

  _SizeChangeCallback<Size> get onChildSizeChanged => _onChildSizeChanged;
  _SizeChangeCallback<Size> _onChildSizeChanged;
  set onChildSizeChanged(_SizeChangeCallback<Size> newCallback) {
    if (_onChildSizeChanged == newCallback) {
      return;
    }

    _onChildSizeChanged = newCallback;
    markNeedsLayout();
  }

  double get animationValue => _animationValue;
  double _animationValue;
  set animationValue(double newValue) {
    if (_animationValue == newValue) {
      return;
    }

    _animationValue = newValue;
    markNeedsLayout();
  }

  bool get isScrollControlled => _isScrollControlled;
  bool _isScrollControlled;
  set isScrollControlled(bool newValue) {
    if (_isScrollControlled == newValue) {
      return;
    }

    _isScrollControlled = newValue;
    markNeedsLayout();
  }

  Size _getSize(BoxConstraints constraints) {
    return constraints.constrain(constraints.biggest);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final double width = _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final double width = _getSize(BoxConstraints.tightForFinite(height: height)).width;
    if (width.isFinite) {
      return width;
    }
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final double height = _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final double height = _getSize(BoxConstraints.tightForFinite(width: width)).height;
    if (height.isFinite) {
      return height;
    }
    return 0.0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _getSize(constraints);
  }

  BoxConstraints _getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      maxHeight: isScrollControlled
          ? constraints.maxHeight
          : constraints.maxHeight * 9.0 / 16.0,
    );
  }

  Offset _getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * animationValue);
  }

  @override
  void performLayout() {
    size = _getSize(constraints);
    if (child != null) {
      final BoxConstraints childConstraints = _getConstraintsForChild(constraints);
      assert(childConstraints.debugAssertIsValid(isAppliedConstraint: true));
      child!.layout(childConstraints, parentUsesSize: !childConstraints.isTight);
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset = _getPositionForChild(size, childConstraints.isTight ? childConstraints.smallest : child!.size);
      final Size childSize = childConstraints.isTight ? childConstraints.smallest : child!.size;

      if (_lastSize != childSize) {
        _lastSize = childSize;
        _onChildSizeChanged.call(_lastSize);
      }
    }
  }
}

class _ModalBottomSheet<T> extends StatefulWidget {
  const _ModalBottomSheet({
    super.key,
    required this.route,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.clipBehavior,
    this.constraints,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.showDragHandle = false,
  });

  final ModalBottomSheetRoute<T> route;
  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final bool enableDrag;
  final bool showDragHandle;

  @override
  _ModalBottomSheetState<T> createState() => _ModalBottomSheetState<T>();
}

class _ModalBottomSheetState<T> extends State<_ModalBottomSheet<T>> {
  ParametricCurve<double> animationCurve = _modalBottomSheetCurve;

  String _getRouteLabel(MaterialLocalizations localizations) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return '';
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return localizations.dialogLabel;
    }
  }

  EdgeInsets _getNewClipDetails(Size topLayerSize) {
    return EdgeInsets.fromLTRB(0, 0, 0, topLayerSize.height);
  }

  void handleDragStart(DragStartDetails details) {
    // Allow the bottom sheet to track the user's finger accurately.
    animationCurve = Curves.linear;
    if(widget.onVerticalDragStart != null) {
      widget.onVerticalDragStart!(details);
    }
  }

  void handleDragEnd(DragEndDetails details, {bool? isClosing}) {
    // Allow the bottom sheet to animate smoothly from its current position.
    animationCurve = _BottomSheetSuspendedCurve(
      widget.route.animation!.value,
      curve: _modalBottomSheetCurve,
    );
    if (widget.onVerticalDragEnd != null) {
      widget.onVerticalDragEnd!(details);
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String routeLabel = _getRouteLabel(localizations);

    return AnimatedBuilder(
      animation: widget.route.animation!,
      child: BottomSheet(
        animationController: widget.route._animationController,
        onClosing: () {
          if (widget.route.isCurrent) {
            Navigator.pop(context);
          }
        },
        builder: widget.route.builder,
        backgroundColor: widget.backgroundColor,
        elevation: widget.elevation,
        shape: widget.shape,
        clipBehavior: widget.clipBehavior,
        constraints: widget.constraints,
        enableDrag: widget.enableDrag,
        showDragHandle: widget.showDragHandle,
        onDragUpdate: widget.onVerticalDragUpdate,
        onDragStart: handleDragStart,
        onDragEnd: handleDragEnd,
      ),
      builder: (BuildContext context, Widget? child) {
        final double animationValue = animationCurve.transform(
          widget.route.animation!.value,
        );
        return Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: routeLabel,
          explicitChildNodes: true,
          child: ClipRect(
            child: _BottomSheetLayoutWithSizeListener(
              onChildSizeChanged: (Size size) {
                widget.route._didChangeBarrierSemanticsClip(
                  _getNewClipDetails(size),
                );
              },
              animationValue: animationValue,
              isScrollControlled: widget.isScrollControlled,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

class ModalBottomSheetRoute<T> extends PopupRoute<T> {
  ModalBottomSheetRoute({
    required this.builder,
    this.capturedThemes,
    this.barrierLabel,
    this.barrierOnTapHint,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle,
    required this.isScrollControlled,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    super.settings,
    this.transitionAnimationController,
    this.anchorPoint,
    this.useSafeArea = false,
  });

  final GestureDragStartCallback? onVerticalDragStart;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final WidgetBuilder builder;
  final CapturedThemes? capturedThemes;
  final bool isScrollControlled;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  final bool? showDragHandle;
  final AnimationController? transitionAnimationController;
  final Offset? anchorPoint;
  final bool useSafeArea;
  final String? barrierOnTapHint;
  final ValueNotifier<EdgeInsets> _clipDetailsNotifier = ValueNotifier<EdgeInsets>(EdgeInsets.zero);
  bool _didChangeBarrierSemanticsClip(EdgeInsets newClipDetails) {
    if (_clipDetailsNotifier.value == newClipDetails) {
      return false;
    }
    _clipDetailsNotifier.value = newClipDetails;
    return true;
  }

  @override
  Duration get transitionDuration => _bottomSheetEnterDuration;

  @override
  Duration get reverseTransitionDuration => _bottomSheetExitDuration;

  @override
  bool get barrierDismissible => isDismissible;

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => modalBarrierColor ?? Colors.black54;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    if (transitionAnimationController != null) {
      _animationController = transitionAnimationController;
      willDisposeAnimationController = false;
    } else {
      _animationController = BottomSheet.createAnimationController(navigator!);
    }
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final Widget content = DisplayFeatureSubScreen(
      anchorPoint: anchorPoint,
      child: Builder(
        builder: (BuildContext context) {
          final BottomSheetThemeData sheetTheme = Theme.of(context).bottomSheetTheme;
          final BottomSheetThemeData defaults = Theme.of(context).useMaterial3 ? _BottomSheetDefaultsM3(context) : const BottomSheetThemeData();
          return _ModalBottomSheet<T>(
            route: this,
            backgroundColor: backgroundColor ?? sheetTheme.modalBackgroundColor ?? sheetTheme.backgroundColor ?? defaults.backgroundColor,
            elevation: elevation ?? sheetTheme.modalElevation ?? defaults.modalElevation ?? sheetTheme.elevation,
            shape: shape,
            onVerticalDragStart: onVerticalDragStart,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
            clipBehavior: clipBehavior,
            constraints: constraints,
            isScrollControlled: isScrollControlled,
            enableDrag: enableDrag,
            showDragHandle: showDragHandle ?? (enableDrag && (sheetTheme.showDragHandle ?? false)),
          );
        },
      ),
    );

    final Widget bottomSheet = useSafeArea
        ? SafeArea(bottom: false, child: content)
        : MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: content,
    );

    return capturedThemes?.wrap(bottomSheet) ?? bottomSheet;
  }

  @override
  Widget buildModalBarrier() {
    if (barrierColor.alpha != 0 && !offstage) { // changedInternalState is called if barrierColor or offstage updates
      assert(barrierColor != barrierColor.withOpacity(0.0));
      final Animation<Color?> color = animation!.drive(
        ColorTween(
          begin: barrierColor.withOpacity(0.0),
          end: barrierColor, // changedInternalState is called if barrierColor updates
        ).chain(CurveTween(curve: barrierCurve)), // changedInternalState is called if barrierCurve updates
      );
      return AnimatedModalBarrier(
        color: color,
        dismissible: barrierDismissible, // changedInternalState is called if barrierDismissible updates
        semanticsLabel: barrierLabel, // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
        clipDetailsNotifier: _clipDetailsNotifier,
        semanticsOnTapHint: barrierOnTapHint,
      );
    } else {
      return ModalBarrier(
        dismissible: barrierDismissible, // changedInternalState is called if barrierDismissible updates
        semanticsLabel: barrierLabel, // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
        clipDetailsNotifier: _clipDetailsNotifier,
        semanticsOnTapHint: barrierOnTapHint,
      );
    }
  }
}
class _BottomSheetSuspendedCurve extends ParametricCurve<double> {
  const _BottomSheetSuspendedCurve(
      this.startingPoint, {
        this.curve = Curves.easeOutCubic,
      });
  final double startingPoint;
  final Curve curve;

  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    assert(startingPoint >= 0.0 && startingPoint <= 1.0);

    if (t < startingPoint) {
      return t;
    }

    if (t == 1.0) {
      return t;
    }

    final double curveProgress = (t - startingPoint) / (1 - startingPoint);
    final double transformed = curve.transform(curveProgress);
    return lerpDouble(startingPoint, 1, transformed)!;
  }

  @override
  String toString() {
    return '${describeIdentity(this)}($startingPoint, $curve)';
  }
}

Future<T?> showBaseModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool useSafeArea = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  GestureDragStartCallback? onVerticalDragStart,
  GestureDragUpdateCallback? onVerticalDragUpdate,
  GestureDragEndCallback? onVerticalDragEnd,
  Offset? anchorPoint,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final NavigatorState navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return navigator.push(ModalBottomSheetRoute<T>(
    builder: builder,
    capturedThemes: InheritedTheme.capture(from: context, to: navigator.context),
    isScrollControlled: isScrollControlled,
    barrierLabel: barrierLabel ?? localizations.scrimLabel,
    barrierOnTapHint: localizations.scrimOnTapHint(localizations.bottomSheetLabel),
    backgroundColor: backgroundColor,
    elevation: elevation,
    onVerticalDragStart: onVerticalDragStart,
    onVerticalDragUpdate: onVerticalDragUpdate,
    onVerticalDragEnd: onVerticalDragEnd,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    settings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
    useSafeArea: useSafeArea,
  ));
}

PersistentBottomSheetController showBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  bool? enableDrag,
  AnimationController? transitionAnimationController,
}) {
  assert(debugCheckHasScaffold(context));

  return Scaffold.of(context).showBottomSheet(
    builder,
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    enableDrag: enableDrag,
    transitionAnimationController: transitionAnimationController,
  );
}

class _BottomSheetGestureDetector extends StatelessWidget {
  const _BottomSheetGestureDetector({
    required this.child,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final Widget child;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      excludeFromSemantics: true,
      gestures: <Type, GestureRecognizerFactory<GestureRecognizer>>{
        VerticalDragGestureRecognizer : GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(debugOwner: this),
              (VerticalDragGestureRecognizer instance) {
            instance
              ..onStart = onVerticalDragStart
              ..onUpdate = onVerticalDragUpdate
              ..onEnd = onVerticalDragEnd
              ..onlyAcceptDragOnThreshold = true;
          },
        ),
      },
      child: child,
    );
  }
}

// BEGIN GENERATED TOKEN PROPERTIES - BottomSheet

// Do not edit by hand. The code between the "BEGIN GENERATED" and
// "END GENERATED" comments are generated from data in the Material
// Design token database by the script:
//   dev/tools/gen_defaults/bin/gen_defaults.dart.

class _BottomSheetDefaultsM3 extends BottomSheetThemeData {
  _BottomSheetDefaultsM3(this.context)
      : super(
    elevation: 1.0,
    modalElevation: 1.0,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28.0))),
    constraints: const BoxConstraints(maxWidth: 640),
  );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get surfaceTintColor => _colors.surfaceTint;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get dragHandleColor => _colors.onSurfaceVariant.withOpacity(0.4);

  @override
  Size? get dragHandleSize => const Size(32, 4);

  @override
  BoxConstraints? get constraints => const BoxConstraints(maxWidth: 640.0);
}

// END GENERATED TOKEN PROPERTIES - BottomSheet
