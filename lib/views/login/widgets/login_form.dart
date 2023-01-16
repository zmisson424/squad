import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';
import 'package:squad/views/login/widgets/apple_button.dart';
import 'package:squad/views/login/widgets/email_button.dart';
import 'package:squad/views/login/widgets/email_dialog.dart';
import 'package:squad/views/login/widgets/facebook_button.dart';
import 'package:squad/views/login/widgets/github_button.dart';
import 'package:squad/views/login/widgets/google_button.dart';
import 'package:squad/views/login/widgets/login_error.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const LoginErrorMessage(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
              ),
              child: Text(
                AppLocalizations.of(context)!.appName,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GoogleLoginButton(
              onPressed: () => print('TODO'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: AppleLoginButton(
                onPressed: () => print("TODO"),
              ),
            ),
            FacebookLoginButton(
              onPressed: () => print("TODO"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
              ),
              child: GithubLoginButton(
                onPressed: () => print("TODO"),
              ),
            ),
            EmailLoginButton(
              onPressed: () => _onEmailButtonClicked(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onEmailButtonClicked(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return BlocProvider.value(
          value: BlocProvider.of<LoginBloc>(context),
          child: const EmailDialog(),
        );
      },
    );
  }
}
