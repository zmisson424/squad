import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({
    Key? key,
    required this.onCreate,
    required this.onForgot,
  }) : super(key: key);

  final Function() onCreate;

  final Function() onForgot;

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  late final TextEditingController _emailController;

  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.of(context)!.emailSignIn,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: SizedBox(
              width: 300,
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: SizedBox(
              width: 300,
              height: 48,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon: const Icon(Icons.password_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: SizedBox(
              width: 300,
              height: 48,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange.shade500,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            EmailLoginAttempt(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signIn,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 18,
            ),
            child: TextButton(
              onPressed: widget.onCreate,
              child: Text(
                AppLocalizations.of(context)!.createAccount,
              ),
            ),
          ),
          TextButton(
            onPressed: widget.onForgot,
            child: Text(
              AppLocalizations.of(context)!.forgotPassword,
            ),
          ),
        ],
      ),
    );
  }
}
