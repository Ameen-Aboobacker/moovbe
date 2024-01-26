part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthRequested extends AuthEvent {
  final String username;
  final String password;
  AuthRequested({required this.username, required this.password});
}
