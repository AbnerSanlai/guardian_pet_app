import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../user/presenter/screens/user_login_screen/bloc/user_login_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserLoginBloc authenticationBloc;
  @override
  void initState() {
    authenticationBloc = Modular.get<UserLoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoginBloc, UserLoginState>(
      bloc: authenticationBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('context.translate.titleApp'),
          ),
          body: const Center(
            child: Text('context.translate.titleApp'),
          ),
        );
      },
    );
  }
}
