import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squad/api/repositories/auth_repository.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';
import 'package:squad/views/login/widgets/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginView());
  }

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(authRepository: context.read<AuthRepository>()),
      child: const LoginForm(),
    );
  }
}
