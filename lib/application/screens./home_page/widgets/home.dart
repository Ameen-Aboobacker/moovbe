import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../driver/bloc/driver_bloc.dart';

import '../../driver/widgets/driver_screen.dart';
import '../bus_bloc/bus_bloc.dart';
import 'buslist_loading.dart';
import 'buslist_widget.dart';
import 'card_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            height: 119,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/logo.png', scale: 1.9),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardWidget(
                onTap: () {},
                title: 'Bus',
                subtitle: 'Manage Your Buses',
                color: Colors.red,
                image: Positioned(
                    right: -15,
                    bottom: 2,
                    child: Image.asset(
                      'assets/images/bus.png',
                      width: 153,
                      height: 102,
                    )),
              ),
              CardWidget(
                onTap: () {
                  context.read<DriverBloc>().add(DriverFetch());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DriverScreen(),
                    ),
                  );
                },
                title: 'Driver',
                subtitle: 'Manage Your Driver',
                color: Colors.black87,
                image: Positioned(
                    right: 3,
                    bottom: 2,
                    child: Image.asset(
                      'assets/images/driver.png',
                      width: 113,
                    )),
              ),
            ],
          ),
          BlocBuilder<BusBloc, BusState>(
            builder: (context, state) {
              if (state is BusFetchSuccess) {
                final busList = state.busModel.bus;
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                        child: Text(
                          '${busList!.length} buses found',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color.fromARGB(255, 112, 111, 111),
                          ),
                        ),
                      ),
                      BusList(
                        busList: busList,
                      )
                    ],
                  ),
                );
              }
              return const BusListLoading();
            },
          )
        ],
      ),
    );
  }
}
