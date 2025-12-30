import 'package:cappuccino/components/base_modal/base_modal_view.dart';
import 'package:flutter/material.dart';

typedef ModalCallback = void Function(bool isClose);
typedef ModalConfirmCallback = Function(AnimationController animationController, Future<void> Function());

class BaseModalFunc {
  static showModal(BuildContext context,
      {String? title = "提示",
      double? width,
      bool? showTitle = true,
      Widget? titleChild,
      Widget? contentChild,
      bool? showFooter = true,
      String cancelText = "取消",
      String? confirmText = "确定",
      bool? showCancel = true,
      ModalCallback? cancelFunc,
      required ModalConfirmCallback confirmFunc,
      bool? showConfirm = true}) {
    late AnimationController childAnimationController;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext parentContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Center(
                child: BaseModalPage(
                    titleText: title,
                    width: width,
                    parentContext: parentContext,
                    showTitle: showTitle,
                    titleChild: titleChild,
                    contentChild: contentChild,
                    showFooter: showFooter,
                    cancelText: cancelText,
                    confirmText: confirmText,
                    showCancel: showCancel,
                    cancelFunc: cancelFunc,
                    confirmFunc: confirmFunc,
                    showConfirm: showConfirm,
                    callback: (AnimationController controller) {
                      childAnimationController = controller;
                    },
                ),
              );
            },
          );
        });
  }
}
