import 'package:flutter/material.dart';
import 'package:moovbe/screens./bus_manage_screen.dart';

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
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Text(
              '21 buses found',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color.fromARGB(255, 112, 111, 111),
              ),
            ),
          ),
          Flexible(
              child: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                          color: Colors.black12,
                          image: DecorationImage(
                              image: AssetImage('assets/images/listbus.png'))),
                      width: 79,
                      height: 73,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('KSRTC'),
                          Text('Swift Scania P-Series'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                         /* Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const BusManageScreen(),
                            ),
                          );*/
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
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 7,
            ),
            itemCount: 10,
          ))
        ],
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
  });
  final String title;
  final String subtitle;
  final Widget image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
