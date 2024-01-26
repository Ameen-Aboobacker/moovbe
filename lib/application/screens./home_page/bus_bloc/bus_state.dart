part of 'bus_bloc.dart';


sealed class BusState {}

final class BusInitial extends BusState {}
final class BusFetchSuccess extends BusState {
 final BusModel busModel;
 BusFetchSuccess(this.busModel);
}