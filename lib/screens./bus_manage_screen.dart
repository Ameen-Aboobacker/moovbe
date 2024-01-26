import 'package:flutter/material.dart';
import 'package:moovbe/models/bus_model.dart';

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
          const SizedBox(height: 60),
          Container(
            width: 283,
            height: 487,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.black26)),
            margin: const EdgeInsets.only(left: 25),
          )
        ],
      ),
    );
  }

  Widget vacantSeatLayout() {
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
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
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
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
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
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
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
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
