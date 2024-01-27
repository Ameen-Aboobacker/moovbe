import 'package:flutter/material.dart';

class SeatLayout extends StatelessWidget {
  const SeatLayout({
    super.key,
    this.color = Colors.red,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            bottom: 5,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            top: 29,
            bottom: 5,
            left: 5,
            right: 5,
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: color),
              ),
            ),
          ),
          Positioned(
            top: 15,
            bottom: 5,
            left: 4,
            right: 30,
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: color),
              ),
            ),
          ),
          Positioned(
            top: 15,
            bottom: 5,
            left: 30,
            right: 4,
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: color),
              ),
            ),
          )
        ],
      ),
    );
  }
}