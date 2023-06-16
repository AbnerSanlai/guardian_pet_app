import 'package:flutter/gestures.dart';
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
import '../../../../../routes/home_routes.dart';
import 'bloc/user_login_bloc.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({
    super.key,
  });

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late final UserLoginBloc _authenticationBloc;
  final TextEditingController _userNameEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _authenticationBloc = Modular.get<UserLoginBloc>();
    super.initState();
  }

  bool isObscure = true;
  IconData icon = FontAwesomeIcons.eye;
  @override
  Widget build(BuildContext context) {
    return PetAppScaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<UserLoginBloc, UserLoginState>(
          bloc: _authenticationBloc,
          listener: (context, state) {
            if (state is UserLoginFailure) {
              SnackbarWidget.showSnackbar(
                context,
                state.message,
              );
            }
            if (state is UserLoginSuccess) {
              Modular.to.pushNamed(
                HomeRoutes.homeScreenInitialRoute,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Text(
                    context.translate.appTitle,
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
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
                  PetAppTextField(
                    textEditingController: _userNameEmailController,
                    hintText: context.translate.enterYouremailUsername,
                    prefixIcon: Icon(
                      size: 20,
                      userIcon(),
                      color: const Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  PetAppTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    obscureText: isObscure,
                    textEditingController: _passwordController,
                    hintText: context.translate.password,
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
                      color: const Color.fromARGB(255, 65, 65, 65),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                    ),
                    child: Text(
                      context.translate.forgotPassword,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 7, 95, 125),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  PetAppButton(
                    text: context.translate.login,
                    loading: state is UserLoginLoading,
                    onPressed: () async {
                      if (_userNameEmailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        _authenticationBloc.add(
                          AuthenticationLoginEvent(
                            username: _userNameEmailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      } else {
                        SnackbarWidget.showSnackbar(
                          context,
                          'Login ou senha vazios',
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: context.translate.dontHaveAccount,
                            style: const TextStyle(
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
                            text: ' ${context.translate.signUp}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 7, 95, 125),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  IconData userIcon() {
    if (_userNameEmailController.text.contains('@')) {
      return FontAwesomeIcons.envelope;
    }
    return FontAwesomeIcons.user;
  }
}
