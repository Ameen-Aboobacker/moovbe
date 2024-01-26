part of 'bus_model.dart';

class Bus {
  int? id;
  String? image;
  String? name;
  String? type;
  String? driverName;
  String? driverLicenseNo;

  Bus(
      {this.id,
      this.image,
      this.name,
      this.type,
      this.driverName,
      this.driverLicenseNo});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    type = json['type'];
    driverName = json['driver_name'];
    driverLicenseNo = json['driver_license_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['type'] = type;
    data['driver_name'] = driverName;
    data['driver_license_no'] = driverLicenseNo;
    return data;
  }
}