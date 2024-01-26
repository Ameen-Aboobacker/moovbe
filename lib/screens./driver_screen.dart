import 'package:flutter/material.dart';
import 'package:moovbe/screens./add_driver.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_sharp, color: Colors.white)),
        backgroundColor: Colors.black,
        title:
            const Text('Drivers List', style: TextStyle(color: Colors.white)),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 15),
          child: Text(
            '21 drivers found',
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
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                        image: DecorationImage(
                            image: AssetImage('assets/images/driver.png'))),
                    width: 79,
                    height: 73,
                    margin: const EdgeInsets.only(right: 10),
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rohit sharma'),
                        Text('Licn no: PJ5151961616'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Delete',
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
          itemCount: 5,
        ))
      ]),
      bottomNavigationBar: Container(
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddDriver(),
                ));
          },
          child: const Text(
            "Add Drivers",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
