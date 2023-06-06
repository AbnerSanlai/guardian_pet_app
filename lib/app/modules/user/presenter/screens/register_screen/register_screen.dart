import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/assets_image_path.dart';
import '../../../../../core/widgets/pet_app_button.dart';
import '../../../../../core/widgets/pet_app_scaffold.dart';
import '../../../../../core/widgets/pet_app_text_field.dart';
import '../../../../../routes/authentication_routes.dart';
import '../../../infra/models/user_model.dart';
import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  late RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = Modular.get<RegisterBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PetAppScaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: BlocConsumer<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            listener: (context, state) {
              if (state is RegisterFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                    ),
                  ),
                );
              }

              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Usuário cadastrado com sucesso',
                    ),
                  ),
                );
                Modular.to.navigate(
                  AuthenticationRoutes.authenticationScreenInitialRoute,
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsImagePath.logoScreen2,
                    height: 240,
                  ),
                  Text(
                    'Sign-up',
                    style: GoogleFonts.oxygen(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  PetAppTextField(
                    textEditingController: _userNameController,
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    textEditingController: _firstNameController,
                    hintText: 'Fist Name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    textEditingController: _emailController,
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    textEditingController: _passwordController,
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    textEditingController: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  PetAppButton(
                    onPressed: () {
                      _registerBloc.add(
                        RegisterUserEvent(
                          userModel: UserModel(
                            email: _emailController.text,
                            fistName: _firstNameController.text,
                            password: _passwordController.text,
                            userName: _userNameController.text,
                          ),
                        ),
                      );
                    },
                    text: 'Sing Up',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppButton(
                    text: 'Cancel',
                    onPressed: () {
                      Modular.to.pop();
                    },
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
