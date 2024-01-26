import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        String username = event.username;
        String password = event.password;
        final response = await http.post(
            Uri.parse('https://flutter-api.noviindus.in/api/LoginApi'),
            body: {
              'username': username,
              'password': password,
            });
        if (response.statusCode == 200) {
          final authData = jsonDecode(response.body);
          final token = authData['access_token'];
          emit(AuthSuccess(token));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
