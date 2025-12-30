class UserPlaceBean {
  String? adcode;
  String? address;
  String? adname;
  String? citycode;
  String? cityname;
  String? distance;
  String? id;
  String? location;
  String? name;
  String? parent;
  String? pcode;
  String? pname;
  String? type;
  String? typecode;

  UserPlaceBean(
      {this.adcode,
        this.address,
        this.adname,
        this.citycode,
        this.cityname,
        this.distance,
        this.id,
        this.location,
        this.name,
        this.parent,
        this.pcode,
        this.pname,
        this.type,
        this.typecode});

  UserPlaceBean.fromJson(Map<String, dynamic> json) {
    adcode = json['adcode'];
    address = json['address'];
    adname = json['adname'];
    citycode = json['citycode'];
    cityname = json['cityname'];
    distance = json['distance'];
    id = json['id'];
    location = json['location'];
    name = json['name'];
    parent = json['parent'];
    pcode = json['pcode'];
    pname = json['pname'];
    type = json['type'];
    typecode = json['typecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adcode'] = adcode;
    data['address'] = address;
    data['adname'] = adname;
    data['citycode'] = citycode;
    data['cityname'] = cityname;
    data['distance'] = distance;
    data['id'] = id;
    data['location'] = location;
    data['name'] = name;
    data['parent'] = parent;
    data['pcode'] = pcode;
    data['pname'] = pname;
    data['type'] = type;
    data['typecode'] = typecode;
    return data;
  }
}
