import 'package:flutter/material.dart';
import 'seat_layout.dart';

class SeatRow extends StatelessWidget {
  const SeatRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        /*Container(
            height: 22,
            width: 30,
            color: Colors.red,
          ),
          const SizedBox(width:20),
          Container(
            height: 22,
            width: 30,
            color: Colors.red,
          ),*/
        SeatLayout(),
        SizedBox(width: 10),
        SeatLayout(),
        SizedBox(width: 47),
        SeatLayout(),
        SizedBox(width: 7),
        SeatLayout(),
      ],
    );
  }
}