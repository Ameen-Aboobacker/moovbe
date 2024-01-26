part of 'bus_bloc.dart';


sealed class BusEvent {}

final class BusFetchData extends BusEvent{
  final String token;
  BusFetchData(this.token);
}
