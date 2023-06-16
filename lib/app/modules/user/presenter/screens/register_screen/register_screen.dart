import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/assets_image_path.dart';
import '../../../../../core/extension/translate_extension.dart';
import '../../../../../core/widgets/pet_app_button.dart';
import '../../../../../core/widgets/pet_app_scaffold.dart';
import '../../../../../core/widgets/pet_app_text_field.dart';
import '../../../../../core/widgets/snackbar_widget.dart';
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
  bool isObscurePass = true;
  bool isObscureConfirmPass = true;
  bool isValid = true;

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
                    context.translate.signUp,
                    style: GoogleFonts.oxygen(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  PetAppTextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    textEditingController: _userNameController,
                    hintText: context.translate.user,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    textEditingController: _firstNameController,
                    hintText: context.translate.firstName,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    textEditingController: _emailController,
                    hintText: context.translate.email,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    obscureText: isObscurePass,
                    textEditingController: _passwordController,
                    hintText: context.translate.password,
                    prefixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      style: const ButtonStyle(),
                      onPressed: () {
                        isObscurePass = !isObscurePass;
                        setState(() {});
                      },
                      icon: Icon(
                        size: 16,
                        isObscurePass
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                      ),
                      color: const Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppTextField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    obscureText: isObscureConfirmPass,
                    textEditingController: _confirmPasswordController,
                    hintText: context.translate.confirmPassword,
                    prefixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      style: const ButtonStyle(),
                      onPressed: () {
                        isObscureConfirmPass = !isObscureConfirmPass;
                        setState(() {});
                      },
                      icon: Icon(
                        size: 16,
                        isObscureConfirmPass
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                      ),
                      color: const Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  PetAppButton(
                    enabled: isSignUp(),
                    loading: state is RegisterLoading,
                    onPressed: () {
                      if (!isSignUp()) {
                        SnackbarWidget.showSnackbar(
                          context,
                          'Preencha todos os campos',
                        );
                        isValid = false;
                      } else if (_emailController.text.isNotEmpty &&
                          _emailController.text.contains('@')) {
                        SnackbarWidget.showSnackbar(
                          context,
                          'Verifique o email informado',
                        );
                        isValid = false;
                      } else if (_passwordController.text.length < 6) {
                        SnackbarWidget.showSnackbar(
                          context,
                          'A senha deve conter no mínimo 6 caracteres',
                        );
                        isValid = false;
                      } else if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        SnackbarWidget.showSnackbar(
                          context,
                          'As senhas não coincidem',
                        );
                        isValid = false;
                      } else if (isValid) {
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
                      }
                      isValid = true;

                      setState(
                        () {},
                      );
                    },
                    text: context.translate.signUp,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  PetAppButton(
                    text: context.translate.cancel,
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

  bool isSignUp() {
    return _emailController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _userNameController.text.isNotEmpty;
  }
}
