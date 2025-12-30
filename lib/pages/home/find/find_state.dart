import 'package:cappuccino/components/card_item.dart';
import 'package:get/get.dart';

class FindState {
  final RxList<CardItemJumpParams> CardList = [
    CardItemJumpParams(
      cardType: CardType.text,
      picture:
      "https://sns-img-qc.xhscdn.com/0f92480d-f347-7dc9-006b-32c913cd5bee?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '"部分水解奶粉必须长期喝|亲测才有说服力',
    ),
    CardItemJumpParams(
      cardType: CardType.video,
      picture:
      "https://sns-img-bd.xhscdn.com/6740a4cf-7043-2f5c-4e45-06d7ae1915af?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30prjacd4mi6g5npha3mgbug7pnq3p60?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '又是美好的一天，加油！',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/d27e224b-403f-3eb7-e7a5-e7e55e2a27c4?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      like: 12,
      cardType: CardType.video,
      username: "十一小困包",
      text: '想要的就要得到 这才是我的人生',
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
    ),
    CardItemJumpParams(
      cardType: CardType.text,
      picture: "https://sns-img-qc.xhscdn.com/20547301-e4f0-972b-e6ff-8e924e4cb527",
      avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "666",
      text: '"部分水解奶粉必须长期喝|亲测才有说服力',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/2ab4d0bc-9c76-15b0-6f80-18192b112956?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '这路为什么会修到山顶上去了，这是通往何处呢？悬崖峭壁上的风景 人间仙境美如画',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/7c010f1b-2368-9c86-dfc7-58006828a0f3?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '被眼前的一幕震撼到了',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/be2186b9-d5ae-7d60-3aaa-fab4710d9f0a?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '扮演的女特工气质很十足，影视拍摄花絮拍戏现场',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/fabfa1a2-d4d8-480c-7c78-5647a75732d9?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '有人看过这部神剧吗❗❓后劲太大了❗',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/6fe07bbf-3bb4-d5cb-c5a6-a8fa26a80508?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61587c6cd4814f05d0439d57.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "防晒小天才！ ",
      text: '防晒小天才！ ',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/d8f6ff6a-b042-052f-940d-914420524e0a?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/641c5622cd57a43821beab46.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '属于天津的法式浪漫🎻每一刻都值得被记录',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/a827f378-d27b-a257-7cfb-03a48bd0c0b9?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30otu903h3s6g4bur6ukir1v43niomao?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '“什么样的人 才会喜欢这样的夜景氛围...”',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-qc.xhscdn.com/b6db3325-97ac-72ec-1a33-0eecd6a946f0?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      like: 12,
      cardType: CardType.video,
      username: "十一小困包",
      text: '是谁在英国🇬🇧3度的天气穿吊带裙啊',
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/6343da45bc75e40b1e43fb9e.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-qc.xhscdn.com/547e3e6c-142a-443f-dbb5-7952e61ab51e?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '谁懂啊！在沙滩真的见到…🈲️🫣🫢🤭',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '带上装备去溪边发个呆',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/863ec559-b5e8-434d-b6b0-2454c12eb874?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '今天来海边拍照啦～ ',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/ea538d28-c5b9-2043-4499-0aba28cfb7da?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '南山竹海一日游 ',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/bae48342-9b56-2c57-7541-12f51695a105?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61587c6cd4814f05d0439d57.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "防晒小天才！ ",
      text: '猜猜我在哪里？ ',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-hw.xhscdn.net/69c13274-ee19-68f3-e9cb-e5efba6966c7?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "十一小困包",
      text: '这样够辣吗？ ',
    ),
    CardItemJumpParams(
      picture:
      "https://sns-img-bd.xhscdn.com/c75cc580-ccd4-673d-30bd-2b763fec590a?imageView2/2/w/540/format/jpg/q/75%7CimageMogr2/strip&redImage/frame/0",
      avatar:
      "https://sns-img-qc.xhscdn.com/42f714b8-bc42-0833-68a4-6a42bffeaf96?imageView2/2/w/60/format/webp|imageMogr2/strip",
      like: 12,
      username: "防晒小天才！ ",
      text: '嗨 今天天气不错 ',
    ),
  ].obs;
  FindState() {
    ///Initialize variables
  }
}
