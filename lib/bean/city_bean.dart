class CityBean {
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

  CityBean(
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

  CityBean.fromJson(Map<String, dynamic> json) {
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
