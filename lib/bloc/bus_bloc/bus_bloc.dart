import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:moovbe/models/bus_model.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  BusBloc() : super(BusInitial()) {
    on<BusFetchData>((event, emit) async {
      try {
        log(event.token);
        final response = await http.get(
          Uri.parse('https://flutter-api.noviindus.in/api/BusListApi'),
          headers: {
            'Authorization': 'Bearer ${event.token}',
          },
          
        );

        if (response.statusCode == 200) {
          final busData = jsonDecode(response.body);
          final busModel = BusModel.fromJson(busData);
          log(busModel.bus!.first.name.toString());
          emit(BusFetchSuccess(busModel));
        } else {
          log(response.statusCode.toString());
        }
      } catch (e) {}
    });
  }
}
