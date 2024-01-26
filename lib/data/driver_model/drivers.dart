part of 'driver_model.dart';

class Drivers {
  int? id;
  String? name;
  String? mobile;
  String? licenseNo;

  Drivers({this.id, this.name, this.mobile, this.licenseNo});

  Drivers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    licenseNo = json['license_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['license_no'] = licenseNo;
    return data;
  }
}
