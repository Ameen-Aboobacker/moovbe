import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe/application/core.dart';

import '../../home_page/bus_bloc/bus_bloc.dart';
import '../../home_page/widgets/home.dart';
import '../auth_bloc/auth_bloc.dart';
import 'title_container.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //GlobalKey<FormState> loginKey=GlobalKey();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthFailure) {}
          if (state is AuthSuccess) {
            accessToken = state.accessToken;
            context.read<BusBloc>().add(
                  BusFetchData(accessToken!),
                );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              const TitleContainer(),
              Padding(
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
                            child: Text('Enter Username'),
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
                            child: Text('Enter Password'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
            shadowColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
          ),
          onPressed: () async {
            context.read<AuthBloc>().add(
                  AuthRequested(
                    username: nameController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
          },
          child: const Text(
            "Login",
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
