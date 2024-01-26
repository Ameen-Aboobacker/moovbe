import 'package:flutter/material.dart';

class BusListLoading extends StatelessWidget {
  const BusListLoading({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (context, index) {
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
