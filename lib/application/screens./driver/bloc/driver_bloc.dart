import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moovbe/application/core.dart';
import 'package:moovbe/data/driver_model/driver_model.dart';
import 'package:moovbe/domain%20/api_services.dart';

part 'driver_event.dart';
part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  DriverBloc() : super(DriverInitial()) {
    on<DriverFetch>((event, emit) async {
      final driverModel = await ApiServices.fetchDriverData();
      emit(DriverFetchSuccess(driverModel));
    });

    on<DriverSave>((event, emit) async {
      final response = await ApiServices.saveDriver(event.driver);
        emit(DriverSaveSuccess(response));
    });
    on<DriverDelete>((event, emit) async {
      final response = await ApiServices.deleteDriver(event.id);
      emit(DriverDeleteSuccess(response));
    });
  }
}
