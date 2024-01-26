part of 'driver_bloc.dart';

@immutable
sealed class DriverEvent {}

final class DriverFetch extends DriverEvent {}

final class DriverSave extends DriverEvent {
 final Drivers driver;

  DriverSave(this.driver);
}

final class DriverDelete extends DriverEvent {
  final String id;
  DriverDelete(this.id);
}
