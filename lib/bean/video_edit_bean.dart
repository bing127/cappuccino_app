import 'dart:io';

class VideoEditBean {
  String? type;
  File? file;

  VideoEditBean({this.type,
    this.file});

  VideoEditBean.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['file'] = file;
    return data;
  }
}