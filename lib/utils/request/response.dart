class BaseResponse {
  int? code;
  bool? success;
  String msg ="";
  dynamic data;

  BaseResponse({this.code, required this.msg, this.data, this.success = false});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = this.data;
    data['success'] = success;
    return data;
  }
}
