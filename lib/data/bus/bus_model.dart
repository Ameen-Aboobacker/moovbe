

part "bus.dart";

class BusModel {
  List<Bus>? bus;
  bool? status;

  BusModel({this.bus, this.status});

  BusModel.fromJson(Map<String, dynamic> json) {
    if (json['bus'] != null) {
      bus = <Bus>[];
      json['bus'].forEach((v) {
        bus!.add(Bus.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (bus != null) {
      data['bus'] = bus!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}