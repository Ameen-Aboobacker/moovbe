import 'package:flutter/material.dart';
import 'seat_layout.dart';

class SeatRow1 extends StatelessWidget {
  const SeatRow1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SeatLayout(),
        SizedBox(width: 47),
        SeatLayout(),
        SizedBox(width: 10),
        SeatLayout(),
        SizedBox(width: 7),
        SeatLayout(),
      ],
    );
  }
}