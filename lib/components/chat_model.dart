enum ChatUser {
  sender,
  receiver
}

enum ChatType {
  text,
  video,
  audio,
  location,
  picture,
  custom
}

class ChatModel {
  String? user;
  String? datetime;
  String? text;
  ChatUser? target;
  ChatType? type;
  String? avatar;

  ChatModel({this.user, this.datetime, this.text, this.target, this.avatar, this.type});
}


class ChatListModel {
  final String? picture;
  final String name;
  final String text;
  final String dateTime;
  final String id;

  ChatListModel({required this.id, this.picture, required this.name, required this.text, required this.dateTime});
}