import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/bus_bloc/bus_bloc.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //GlobalKey<FormState> loginKey=GlobalKey();
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthFailure) {}
          if (state is AuthSuccess) {
            context.read<BusBloc>().add(
                  BusFetchData(state.accessToken),
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
              Stack(
                children: [
                  Container(
                    color: Colors.black,
                    width: size.width,
                    height: 266,
                    child: CustomPaint(painter: DrawPainter()),
                  ),
                  const Positioned(
                    left: 30,
                    top: 127,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 41,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Manage Your Buses And Drivers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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

class DrawPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    // Rect rect=Rect.fromCircle(center: Offset(size.height/2,size.width/2), radius: size.width/2);
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 2 / 3)
      ..lineTo(size.width * 5 / 6, size.height)
      ..lineTo(size.width / 6, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
