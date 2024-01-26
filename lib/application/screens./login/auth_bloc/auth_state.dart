part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String accessToken;
  AuthSuccess(this.accessToken);
}

final class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

final class AuthLoading extends AuthState {}
