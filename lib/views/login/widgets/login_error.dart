import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';

class LoginErrorMessage extends StatelessWidget {
  const LoginErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: ((context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            content: Text(
              state.errorMessage ?? 'Invalid login attempt.',
              style: const TextStyle(color: Colors.white),
            ),
          ));
        }
      }),
      child: Container(),
    );
  }
}
