class RegeoBean {
  String? info;
  String? infocode;
  Regeocode? regeocode;
  String? status;

  RegeoBean({this.info, this.infocode, this.regeocode, this.status});

  RegeoBean.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    infocode = json['infocode'];
    regeocode = json['regeocode'] != null
        ? new Regeocode.fromJson(json['regeocode'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = this.info;
    data['infocode'] = this.infocode;
    if (this.regeocode != null) {
      data['regeocode'] = this.regeocode!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Regeocode {
  AddressComponent? addressComponent;
  String? formattedAddress;

  Regeocode({this.addressComponent, this.formattedAddress});

  Regeocode.fromJson(Map<String, dynamic> json) {
    addressComponent = json['addressComponent'] != null
        ? new AddressComponent.fromJson(json['addressComponent'])
        : null;
    formattedAddress = json['formatted_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressComponent != null) {
      data['addressComponent'] = this.addressComponent!.toJson();
    }
    data['formatted_address'] = this.formattedAddress;
    return data;
  }
}

class AddressComponent {
  String? adcode;
  String? city;
  String? citycode;
  String? country;
  String? district;
  String? province;
  String? towncode;
  String? township;

  AddressComponent(
      {this.adcode,
        this.city,
        this.citycode,
        this.country,
        this.district,
        this.province,
        this.towncode,
        this.township});

  AddressComponent.fromJson(Map<String, dynamic> json) {
    adcode = json['adcode'];
    city = json['city'];
    citycode = json['citycode'];
    country = json['country'];
    district = json['district'];
    province = json['province'];
    towncode = json['towncode'];
    township = json['township'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adcode'] = this.adcode;
    data['city'] = this.city;
    data['citycode'] = this.citycode;
    data['country'] = this.country;
    data['district'] = this.district;
    data['province'] = this.province;
    data['towncode'] = this.towncode;
    data['township'] = this.township;
    return data;
  }
}