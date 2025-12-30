import 'package:cappuccino/components/shop_item.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'cart_logic.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CartLogic>();
    final state = Get.find<CartLogic>().state;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: IconButton(
            icon:
                const Icon(RemixIcon.arrow_left_s_outline, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: const Text(
            "购物车(13)",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "管理",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ))
          ],
        ),
        body: ListView(
          children: [
            _store(
              [
                _storeItem(),
                _storeItem(),
              ]
            ),
            _store(
                [
                  _storeItem(),
                ]
            ),
            _recommend(),
          ],
        ),
        bottomNavigationBar: _footer(),
      ),
    );
  }

  Widget _store(List<Widget> child) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
      decoration: BoxDecoration(
         color: Colors.white,
         border: Border(
           bottom: BorderSide(
             width: 0.5,
             color: Colors.black.withOpacity(0.1)
           )
         )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Icon(
                    RemixIcon.circle_outline,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Utils.cachePicture(
                          "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
                          width: 30,
                          height: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text("小美的店"),
                  ),
                  Icon(RemixIcon.arrow_right_s_outline,
                      color: Colors.black.withOpacity(0.6)),
                ],
              ),
            ),
          ),
          ...child,
        ],
      ),
    );
  }

  Widget _storeItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            RemixIcon.circle_outline,
            color: Colors.black.withOpacity(0.3),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Utils.cachePicture(
                        "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
                        width: 86,
                        height: 86),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("白象 · 汤好喝老母鸡汤方便面泡面10种口味美味可选免煮速食组合装新人购物", style: TextStyle(fontSize: 14, height: 1.5), maxLines: 2,),
                         Padding(
                           padding: const EdgeInsets.symmetric(
                             vertical: 4
                           ),
                           child: Wrap(
                             spacing: 3,
                             runSpacing: 3,
                             children: [
                               _basicInfoTag("下单返0.7元"),
                               _basicInfoTag("商家券 ｜ 满79减3"),
                               _basicInfoTag("下单返0.7元"),
                             ],
                           ),
                         ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "¥",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                  Text(
                                    "9.23",
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1,
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 4
                                ),
                                decoration: BoxDecoration(
                                   border: Border.all(
                                     color:  Colors.black.withOpacity(0.6),
                                     width: 0.5
                                   ),
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: Text(
                                  "X23",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black.withOpacity(0.6)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _recommend() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "猜你喜欢",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t20260827/220817/32/35154/23241/64ec1ab4F5dfe65ed/6af0e0ccdc20fd0c.jpg.webp",
                  price: 7788.9,
                  text:
                  "联想拯救者Y7000P 2023款16英寸专业电竞游戏本 满功耗RTX4050-6G独显 13代标压酷睿 i5-13500H 16G 1TB  定制版 16英寸电竞屏｜2.5K｜165Hz",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },
                ),
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t20260619/208709/3/36645/26321/64916ab3F863fb7e7/0d9e57d0ef3ba111.jpg.webp",
                  price: 7788.9,
                  text:
                  "神舟（HASEE）战神Z7/Z8/Z9/ 13代英特尔酷睿i7/i9 RTX4050/4060/4070游戏笔记本电脑 S8D6QHD升级 i7/16G/1TB/4060 支持独显直连 高刷新电竞屏",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t1/194436/24/40476/191994/65309667F585ba8a7/66b8a82c22a0b6a5.jpg.webp",
                  price: 7788.9,
                  text:
                  "Punos（博浪沙）全新Ai智能语音点歌评分ktv音响套装3D环绕HiFi家庭影院客厅音箱家庭ktv唱歌全套设备 PS-28 Pro 一体式3D影院KTV套装",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/686b7b8d-4536-0813-4b43-68ae3fb83981",
                  price: 7788.9,
                  text: "华为鸿蒙4.0对比小米miui14 丝滑和闪电",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/8c6e5030-5a3a-3ff6-3e7f-0dcc161026f3",
                  price: 7788.9,
                  text: "2人住进90平的小家🏠婚后生活比想象快乐",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/b34051a7-b1be-d644-265c-45408e60c85d",
                  price: 7788.9,
                  text: "我妈说，普通人的家干净清爽就够了！",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _basicInfoTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
          color: BasicColor.mainColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: BasicColor.mainColor, width: 0.5)),
      child: Text(
        text,
        style: TextStyle(color: BasicColor.mainColor, fontSize: 10),
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: EdgeInsets.only(
          top: 4, left: 12, right: 12, bottom: Get.mediaQuery.padding.bottom),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Row(
              children: [
                Icon(
                  RemixIcon.circle_outline,
                  color: Colors.black.withOpacity(0.3),
                ),
                const Text("全选")
              ],
            ),
          ),
          Wrap(
            spacing: 20,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "总计:",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: "¥0.32",
                          style: TextStyle(
                              color: BasicColor.mainColor,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(BasicColor.mainColor),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 0, horizontal: 18),
                    )),
                child: const Text(
                  "结算",
                  style: TextStyle(letterSpacing: 4),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
