part of 'driver_bloc.dart';

@immutable
sealed class DriverState {}

final class DriverInitial extends DriverState {}
final class DriverFetchSuccess extends DriverState{
   final DriverModel driverModel;
 DriverFetchSuccess(this.driverModel);
}
final class DriverSaveSuccess extends DriverState{
   final String message;
 DriverSaveSuccess(this.message);
}
final class DriverDeleteSuccess extends DriverState{
   final String message;
 DriverDeleteSuccess(this.message);
}
