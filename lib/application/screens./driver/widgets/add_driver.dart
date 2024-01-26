import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/driver_model/driver_model.dart';
import '../bloc/driver_bloc.dart';

class AddDriver extends StatelessWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return BlocListener<DriverBloc, DriverState>(
      listener: (context, state) {
        if (state is DriverSaveSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Text(
            'Add Driver',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    label: Center(
                      child: Text('Enter Name'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: true,
                    label: Center(
                      child: Text('Enter License Number'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 45,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              final name = nameController.text.trim();
              final licenseNo = passwordController.text.trim();
              final Drivers driver = Drivers(
                name: name,
                mobile: '888888',
                licenseNo: licenseNo,
              );
              context.read<DriverBloc>().add(DriverSave(driver));
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
