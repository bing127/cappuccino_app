import 'package:cappuccino/components/shop_item.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'business_logic.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BusinessLogic(),
      assignId: true,
      builder: (BusinessLogic logic) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: SingleChildScrollView(
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
          ),
        );
      },
    );
  }
}
