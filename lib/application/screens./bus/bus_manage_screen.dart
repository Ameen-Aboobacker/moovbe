import 'package:flutter/material.dart';

import '../../../data/bus/bus_model.dart';
import 'seat_layout.dart';
import 'seat_row.dart';
import 'seat_row_1.dart';

class BusManageScreen extends StatelessWidget {
  const BusManageScreen({Key? key, required this.bus}) : super(key: key);
  final Bus bus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 116,
            width: 335,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bus.driverName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 26),
                        ),
                        Text(
                          bus.driverLicenseNo!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22, top: 10),
                  child: Image.asset('assets/images/driver.png'),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
              width: 283,
              height: 535,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black26)),
              margin: const EdgeInsets.only(left: 25),
              child: bus.type == 'AC'
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(28, 20, 28, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SeatLayout(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow1(),
                        ],
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.fromLTRB(28, 34, 28, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SeatLayout(
                            color: Colors.black,
                          ),
                          SizedBox(height: 10),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                          SizedBox(
                            height: 10,
                          ),
                          SeatRow(),
                        ],
                      ),
                    )),
        ],
      ),
    );
  }
}






