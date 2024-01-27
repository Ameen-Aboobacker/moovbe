import 'package:flutter/material.dart';


import '../../../../data/bus/bus_model.dart';
import '../../bus/bus_manage_screen.dart';

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