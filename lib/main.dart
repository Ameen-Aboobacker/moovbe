import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moovbe/application/screens./splash.dart';

import 'application/screens./driver/bloc/driver_bloc.dart';
import 'application/screens./home_page/bus_bloc/bus_bloc.dart';
import 'application/screens./login/auth_bloc/auth_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => BusBloc()),
        BlocProvider(create: (_) => DriverBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moovbe',
        theme: ThemeData(
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(Colors.red),
            ),
          ),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
