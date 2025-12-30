import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'search_logic.dart';

class SearchPage extends StatelessWidget {
   const SearchPage({super.key});


   @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchLogic(),
      assignId: true,
      builder: (SearchLogic logic) {
        return GestureDetectorView(
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              titleSpacing: 0,
              leading: const SizedBox.shrink(),
              automaticallyImplyLeading: true,
              title: Container(
                height: 34,
                margin: const EdgeInsets.only(
                  left: 12
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100)
                ),
                child: TextField(
                  controller: logic.state.searchTextEditingController.value,
                  textInputAction: TextInputAction.search,
                  scrollPadding: EdgeInsets.zero,
                  cursorColor: BasicColor.mainColor,
                  style: const TextStyle(
                      fontSize: 14
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: '输入关键字',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 14
                    ),
                    prefixIcon: Icon(
                      RemixIcon.search_2_outline,
                      color:  Colors.black.withOpacity(0.6),
                      size: 16,
                    ),
                    suffixIcon: Obx(() => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: logic.suffixTap,
                        child: Icon(
                          logic.state.isClear.value ?
                          RemixIcon.close_circle : RemixIcon.camera_3_outline,
                          color: Colors.black.withOpacity(0.3),
                          size: 16,
                        ),
                      ),
                    )),
                    prefixIconConstraints: const BoxConstraints(
                        minWidth: 30
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              actions: [
                InkWell(onTap: () {
                  Get.back();
                }, child: Center(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:  Text("取消", style: TextStyle(
                        color: Colors.black.withOpacity(0.6)
                    ),),
                  ),
                ))
              ],
            ),
            body: ListView(
              children: [
                _panel("历史记录", Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: 10,
                          maxWidth: 90
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                                width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Text("测试发说说是生生世世", style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 14
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ), style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ), right: InkWell(
                  child: Icon(RemixIcon.delete_bin_6_outline, size: 16, color: Colors.black.withOpacity(0.6),),
                )),
                _panel("猜你想搜", Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Text("测试事实是生生世世", style: TextStyle(
                          fontSize: 14
                      ),),
                    ),
                  ],
                ), style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                ), right: InkWell(
                  onTap: logic.textRefresh,
                  child: Row(
                    children: [
                      Obx(() => RotationTransition(
                        turns: logic.animationController.value,
                        child: Icon(RemixIcon.refresh_outline, size: 16, color: Colors.black.withOpacity(0.6)),
                      )),
                      Text(
                        "换一换",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6)
                        ),
                      )
                    ],
                  ),
                )),
                _panel("", ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                    _listItem(),
                  ],
                ) ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _panel(String text, Widget child, {TextStyle? style, Widget? right}) {
     return Container(
       padding: const EdgeInsets.only(
         left: 13.6,
         right: 13.6,
         top: 6,
         bottom: 6
       ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                  text.isNotEmpty ? Text(
                      text,
                      style: style,
                  ) : _gradientText(),
                 right ?? const SizedBox.shrink()
               ],
             ),
             Padding(
               padding: const EdgeInsets.symmetric(
                 vertical: 10
               ),
                 child: child
             )
          ],
        ),
     );
  }

  Widget _gradientText() {
    Gradient gradient = LinearGradient(colors: [
      const Color.fromRGBO(253, 157, 0, 1),
      BasicColor.mainColor
    ]);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Text('搜索发现',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            foreground: Paint()..shader = gradient.createShader(Rect.fromLTWH(0, 0, 100, constraints.minHeight))));
      }

    );
  }

  Widget _listItem() {
     return Container(
       width: double.infinity,
       padding: const EdgeInsets.symmetric(
           vertical: 12
       ),
       decoration: BoxDecoration(
           border: Border(
               bottom: BorderSide(
                   color: Colors.black.withOpacity(0.1),
                  width: 0.5
               )
           )
       ),
       child: Row(
         children: [
           Container(
             width: 4,
             height: 4,
             margin: const EdgeInsets.only(
               right: 10
             ),
             decoration: BoxDecoration(
                 color: BasicColor.mainColor,
                 borderRadius: BorderRadius.circular(10)
             ),
           ),
           Expanded(child: Text(
               "iOS 17.1 正式版新功能汇总整理",
              style: TextStyle(
                fontSize: 13.6
              ),
           )),
           Row(
             children: [
                Text(
                  "1123.3w",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 12
                  ),
                ),
               Icon(
                 RemixIcon.arrow_up,
                 size: 14,
                 color: BasicColor.mainColor,
               )
             ],
           )
         ],
       ),
     );
  }
}
