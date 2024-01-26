import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moovbe/data/bus/bus_model.dart';
import 'package:moovbe/domain%20/api_services.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  BusBloc() : super(BusInitial()) {
    on<BusFetchData>((event, emit) async {
      final busModel = await ApiServices.fetchBusData();
      emit(BusFetchSuccess(busModel));
    });
  }
}
