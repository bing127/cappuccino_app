import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/components/shop_item.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'shop_logic.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ShopLogic>();
    final state = Get.find<ShopLogic>().state;
    return CacheWidget(
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leading: const SizedBox.shrink(),
            automaticallyImplyLeading: true,
            titleSpacing: 0,
            title: Container(
              height: 34,
              margin: const EdgeInsets.only(
                  left: 12
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    RemixIcon.search_2_outline,
                    color: Colors.black.withOpacity(0.6),
                    size: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 6
                    ),
                    child: Text(
                      "华为Mate60Pro 遥遥领先",
                      style: TextStyle(
                          fontSize: 13
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        RemixIcon.more_outline,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ))
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(36),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                              width: 0.5,
                              color: Colors.black.withOpacity(0.2),
                            ))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(RemixIcon.file_list_2_outline,
                                size: 16,
                                color: Colors.black.withOpacity(0.6)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "我的订单",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(BorderSide(
                              width: 0.5,
                              color: Colors.black.withOpacity(0.2),
                            ))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(RemixIcon.shopping_cart_2_outline,
                                size: 16,
                                color: Colors.black.withOpacity(0.6)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "购物车",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed("${Routes.shop}${Routes.shopCart}");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t20260827/220817/32/35154/23241/64ec1ab4F5dfe65ed/6af0e0ccdc20fd0c.jpg.webp",
                  price: 7788.9,
                  text:
                  "联想拯救者Y7000P 2023款16英寸专业电竞游戏本 满功耗RTX4050-6G独显 13代标压酷睿 i5-13500H 16G 1TB  定制版 16英寸电竞屏｜2.5K｜165Hz",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
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
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
