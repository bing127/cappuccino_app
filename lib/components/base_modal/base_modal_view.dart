import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_modal_func.dart';
import 'base_modal_logic.dart';

class BaseModalPage extends StatelessWidget {
  final Function(AnimationController) callback;
  late double? width;
  late String? titleText;
  late bool? showTitle;
  final BuildContext parentContext;
  late Widget? titleChild;
  late Widget? contentChild;
  late bool? showFooter;
  late String? cancelText;
  late String? confirmText;
  late bool? showCancel;
  late ModalCallback? cancelFunc;
  late ModalConfirmCallback confirmFunc;
  late bool? showConfirm;
  BaseModalPage(
      {super.key,
      this.width = 0.0,
      this.titleText = "提示",
      this.showTitle = true,
      this.titleChild,
      this.showFooter = true,
      this.cancelText = "取消",
      this.confirmText = "确定",
      this.showCancel = true,
      this.showConfirm = true,
      this.contentChild,
      required this.callback,
      required this.parentContext,
      this.cancelFunc, required this.confirmFunc});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        assignId: true,
        initState: (GetBuilderState<BaseModalLogic>? state) {},
        init: BaseModalLogic(),
        builder: (BaseModalLogic logic) {
          Widget confirm = const SizedBox.shrink();
          Widget cancel = const SizedBox.shrink();
          Widget title = const SizedBox.shrink();
          Future<void> onClose() async {
            logic.state.animationController.value.reverse();
            await Future.delayed(const Duration(milliseconds: 200), () {
              Navigator.of(parentContext).pop();
            });
          }

          if (showFooter == true) {
            if(showCancel == true) {
              cancel = OutlinedButton(onPressed: () {
                cancelFunc ?? () {};
                onClose();
              }, style: const ButtonStyle(
                  side: MaterialStatePropertyAll(BorderSide(
                      width: 0.5,
                      color: Color(0xffcccccc)
                  ))
              ), child: Text(
                cancelText!,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6)
                ),
              ),);
            }
            if(showConfirm == true) {
              confirm = OutlinedButton(
                onPressed: () {
                  confirmFunc(logic.state.animationController.value, onClose) ?? () {};
                }, style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(BasicColor.mainColor),
                  side: const MaterialStatePropertyAll(BorderSide.none)
              ), child: Text(
                confirmText!,
                style: const TextStyle(
                    color: Colors.white
                ),
              ),);
            }
          }

          if(showTitle == true) {
            if(titleChild != null) {
              title = titleChild!;
            } else {
              title = Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    vertical: 12
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: Color(0xffcccccc)
                        )
                    )
                ),
                child: Text(
                  "$titleText",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              );
            }
          }

          double? defaultWidth = Get.width / 1.3;
          if(width != null && width != 0.0) {
            defaultWidth = width;
          }
          return AnimatedBuilder(
            animation: logic.state.animationController.value,
            builder: (context, child) {
              double scale = logic.state.animationController.value.value;
              if(scale == 1) {
                 callback(logic.state.animationController.value);
              }
              return Transform.scale(
                scale: scale,
                child: Container(
                  width: defaultWidth,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10
                        ),
                        child: contentChild,
                      ),
                      showFooter == true ? SizedBox(
                        height: 46,
                        child: Row(
                          children: [
                            Expanded(
                              child: cancel,
                            ),
                            Expanded(
                              child: confirm,
                            )
                          ],
                        ),
                      ) : const SizedBox.shrink()
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

}
