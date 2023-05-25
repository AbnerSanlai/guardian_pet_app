import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants/assets_image_path.dart';
import '../../../../../routes/authentication_routes.dart';
import '../../../../../routes/home_routes.dart';
import 'bloc/authentication_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    super.key,
  });

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late final AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    _authenticationBloc = Modular.get<AuthenticationBloc>();
    super.initState();
  }

  bool isObscure = true;
  IconData icon = FontAwesomeIcons.eye;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(10, 32, 168, 214),
              Color.fromARGB(30, 32, 168, 214),
              Color.fromARGB(40, 32, 168, 214),
              Color.fromARGB(50, 32, 168, 214),
              //add more colors for gradient
            ],
            transform: GradientRotation(0.5),
            begin: Alignment.centerLeft, //begin of the gradient color
            end: Alignment.bottomRight, //end of the gradient color
            stops: [0, 0.2, 0.5, 0.8], //stops for individual color
            //set the stops number equal to numbers of color
          ),
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            bloc: _authenticationBloc,
            listener: (context, state) {
              if (state is AuthenticationFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.message}'),
                  ),
                );
              }

              if (state is AuthenticationSuccess) {
                Modular.to.pushNamed(
                  HomeRoutes.homeScreenInitialRoute,
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  const Text(
                    'Pet Guardian',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: Image.asset(
                      AssetsImagePath.logoScreen,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30,
                      left: 20,
                      right: 20,
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          size: 16,
                          FontAwesomeIcons.envelope,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          style: const ButtonStyle(),
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          icon: Icon(
                            size: 16,
                            isObscure
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                          ),
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 35,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 168, 214),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _authenticationBloc.add(
                        AuthenticationGoogleEvent(),
                      );
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(350, 64),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(140, 32, 168, 214),
                      ),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Modular.to.pushNamed(
                                  AuthenticationRoutes.singUpScreenInitialRoute,
                                );
                              },
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 32, 168, 214),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
