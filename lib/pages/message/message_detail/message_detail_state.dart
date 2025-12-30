import 'package:cappuccino/components/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDetailState {
  final Rx<ScrollController> scrollController = ScrollController().obs;
  late RxList<ChatModel> chartData = <ChatModel>[
    ChatModel(
      target: ChatUser.sender,
      text: "我就不在群里分享了",
      avatar:
      "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
      user: "哈哈哈",
    ),
    ChatModel(
      target: ChatUser.receiver,
      text:
      '{4750237067526171: "{"uid":"4750237067526171","ip":"127.0.0.1","url":"/journal/findJournalInformationById","method":"POST","originalUrl":"/journal/findJournalInformationById","host":"localhost","referer":"http://localhost:9527/","dot":"user","time":"2023-07-14 01:30:36"}"}',
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
    ChatModel(
      target: ChatUser.receiver,
      text: '大佬们，我使用 eval(`(\${this.objectText})`) 怎么不能把它转成对象呢？',
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
    ChatModel(
      target: ChatUser.receiver,
      text:
      '{4750237067526171: "{"uid":"4750237067526171","ip":"127.0.0.1","url":"/journal/findJournalInformationById","method":"POST","originalUrl":"/journal/findJournalInformationById","host":"localhost","referer":"http://localhost:9527/","dot":"user","time":"2023-07-14 01:30:36"}"}',
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
    ChatModel(
      target: ChatUser.receiver,
      text: '大佬们，我使用 eval(`(\${this.objectText})`) 怎么不能把它转成对象呢？',
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
    ChatModel(
      target: ChatUser.receiver,
      text: "为什么不用JSON.parse",
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
    ChatModel(
      target: ChatUser.sender,
      text: "我就不在群里分享了",
      avatar:
      "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
      user: "哈哈哈",
    ),
    ChatModel(
      target: ChatUser.sender,
      text: "我前端也还ok吧 只是讨论mac 和 win我需要矫正一下而已 才辩论起来",
      avatar:
      "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
      user: "哈哈哈",
    ),
    ChatModel(
      target: ChatUser.receiver,
      text: "关于函数式组件的自动引入，可以接入 unplugin-auto-import，避免手动引入样式，会有更好的开发体验。",
      avatar: Get.arguments['avatar'],
      user: Get.arguments['name'],
    ),
  ].obs;
  MessageDetailState() {
    ///Initialize variables
  }
}
