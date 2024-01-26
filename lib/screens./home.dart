import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe/models/bus_model.dart';
import 'package:moovbe/screens./bus_manage_screen.dart';
import 'package:moovbe/screens./driver_screen.dart';

import '../bloc/bus_bloc/bus_bloc.dart';

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
              TabWidget(
                onTap: () {
                  log('ssss');
                },
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
              TabWidget(
                onTap: () {
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

class BusList extends StatelessWidget {
  const BusList({
    super.key,
    required this.busList,
  });

  final List<Bus>? busList;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final bus = busList![index];
          final image = 'https://flutter-api.noviindus.in${bus.image}';
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(10)),
                        color: Colors.black12,
                        image: DecorationImage(image: NetworkImage(image))),
                    width: 79,
                    height: 73,
                    margin: const EdgeInsets.only(right: 10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bus.name!),
                        Text(bus.type!),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BusManageScreen(bus: bus),
                          ),
                        );
                      },
                      child: const Text(
                        'Manage',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 7,
        ),
        itemCount: 5,
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final Widget image;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            height: 176,
            width: 158,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          image
        ],
      ),
    );
  }
}

class BusListLoading extends StatelessWidget {
  const BusListLoading({
    super.key,
    // required this.busList,
  });

  //final List<Bus>? busList;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (context, index) {
          // final bus = busList[index];
          /* final image =
              'https://flutter-api.noviindus.in${bus.image}';*/
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10)),
                      color: Colors.black12,
                      /* image: DecorationImage(
                            image: NetworkImage(image))*/
                    ),
                    width: 79,
                    height: 73,
                    margin: const EdgeInsets.only(right: 10),
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(bus.name!),
                        //Text(bus.type!),
                      ],
                    ),
                  ),
                
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 7,
        ),
        itemCount: 5,
      ),
    );
  }
}
