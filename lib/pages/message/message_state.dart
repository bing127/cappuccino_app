import 'package:cappuccino/components/chat_model.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:get/get.dart';

class MessageState {
  late RxList<ChatListModel> chartData = [
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30q4vv7on766g5n4trgf5uu6so159g5g?imageView2/2/w/60/format/webp|imageMogr2/strip', name: "小新爱干饭", text: "你一句春不晚、我便到真江南你一句春不晚、我便到真江南你一句春不晚、我便到真江南", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30qona9eeh26g5p9seaq1gol4ajrjhc8?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "地理瞰察员", text: "看图猜城市。亚洲发达城市，谁会是你心头爱？", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/643a6e8265df400ad6986331.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip', name: "小元酱酱", text:"我的日常", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1000g2jo2kfolt6qja0005nvd34e0bokpkl0tv5g?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "小也yeah", text: "偶尔也想远离喧嚣，去自然里躲一躲", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-img-qc.xhscdn.com/405348ff-4de0-d977-5429-5de6ef5ff496?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "送君玫瑰", text: "成熟的美单身70后 耐看型", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/62c465dca9e6bb3165dc5257.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "蜡笔小喵", text: "我的日常", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30q4vv7on766g5n4trgf5uu6so159g5g?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "ciciiiiiuuu", text: "网友面基 ", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30od2ostt2c004bm63d4bfgmuneqth88?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "川川", text: "长筒靴避雷不二鞋坊 ", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/61587c6cd4814f05d0439d57.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "乌梅番茄🍅漳州小辣目", dateTime: '2023-11-13 21:31:06', text: " 防晒小天才！ "),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/642d6f32062888d4057a0a12.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "圆脸小王", dateTime: '2023-11-13 21:31:06', text: "微胖姐妹给我大胆穿！"),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30qldgmrjgq6g49v05u3pi6afsu13tkg?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "飞鸟与鱼", text: "无聊ing", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30n42tcoolk004busql86k2p00n8guno?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "shmily", text: "占有欲犯了 报备一下你在干嘛", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "甜了个莉莉", text: "OOTD｜胶片日常🎞️秋天也要乖乖甜甜", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-img-hw.xhscdn.net/3ae4fd51-c576-21c1-19c1-5617661e09ba?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "小红薯653B1187", text: "今天济南阳光明媚 ", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/61dd7629ed63359126bbd0b4.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "一盆大蒜", dateTime: '2023-11-13 21:31:06', text: "我的随手拍 "),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30okt9nna2i005p7hbog14hp3n3mujh0?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "张沁恬", text: "用阳光来形容青春 ", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30qcg4crk02005p25u5p4mm8klnlb8s0?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "kk", text: "穿成这样去健身可以吗 ", dateTime: '2023-11-13 21:31:06'),
    ChatListModel(id: Utils.uuid(),picture: 'https://sns-img-bd.xhscdn.com/05a183db-3ca5-b127-45fd-c8ae448664f6?imageView2/2/w/60/format/webp|imageMogr2/strip',  name: "健身look ", text: "wwlin", dateTime: '2023-11-13 21:31:06')
  ].obs;
  MessageState() {
    ///Initialize variables
  }
}
