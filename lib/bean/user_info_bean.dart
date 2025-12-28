class UserInfoBean {
  User? user;

  UserInfoBean({this.user});

  UserInfoBean.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deptId;
  String? cityId;
  String? userName;
  String? nickName;
  String? userType;
  String? email;
  String? ksId;
  String? phoneNumber;
  String? birthday;
  String? profile;
  String? sex;
  String? avatar;
  String? password;
  String? status;
  String? loginIp;
  String? loginDate;
  String? latitude;
  String? longitude;
  String? remark;
  String? createBy;
  String? updateBy;
  List<CityList>? cityList;

  User(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deptId,
        this.cityId,
        this.userName,
        this.nickName,
        this.userType,
        this.ksId,
        this.email,
        this.phoneNumber,
        this.birthday,
        this.profile,
        this.sex,
        this.avatar,
        this.password,
        this.status,
        this.loginIp,
        this.loginDate,
        this.latitude,
        this.longitude,
        this.remark,
        this.createBy,
        this.updateBy,
        this.cityList});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deptId = json['dept_id'];
    cityId = json['city_id'];
    userName = json['user_name'];
    nickName = json['nick_name'];
    userType = json['user_type'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    birthday = json['birthday'];
    ksId = json['ksId'];
    profile = json['profile'];
    sex = json['sex'];
    avatar = json['avatar'];
    password = json['password'];
    status = json['status'];
    loginIp = json['login_ip'];
    loginDate = json['login_date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    remark = json['remark'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    if (json['city_list'] != null) {
      cityList = <CityList>[];
      json['city_list'].forEach((v) {
        cityList!.add(CityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['dept_id'] = deptId;
    data['city_id'] = cityId;
    data['ksId'] = ksId;
    data['user_name'] = userName;
    data['nick_name'] = nickName;
    data['user_type'] = userType;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['birthday'] = birthday;
    data['profile'] = profile;
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['password'] = password;
    data['status'] = status;
    data['login_ip'] = loginIp;
    data['login_date'] = loginDate;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['remark'] = remark;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    if (cityList != null) {
      data['city_list'] = cityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityList {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? code;
  String? name;
  String? province;
  String? city;
  String? area;
  String? town;
  String? createBy;
  String? updateBy;

  CityList(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.code,
        this.name,
        this.province,
        this.city,
        this.area,
        this.town,
        this.createBy,
        this.updateBy});

  CityList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    code = json['code'];
    name = json['name'];
    province = json['province'];
    city = json['city'];
    area = json['area'];
    town = json['town'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['code'] = code;
    data['name'] = name;
    data['province'] = province;
    data['city'] = city;
    data['area'] = area;
    data['town'] = town;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    return data;
  }
}
