part 'drivers.dart';

class DriverModel {
  List<Drivers>? drivers;
  bool? status;

  DriverModel({this.drivers, this.status});

  DriverModel.fromJson(Map<String, dynamic> json) {
    if (json['drivers'] != null) {
      drivers = <Drivers>[];
      json['drivers'].forEach((v) {
        drivers!.add(Drivers.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (drivers != null) {
      data['drivers'] = drivers!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}
