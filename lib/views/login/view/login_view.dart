import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/views/login/widgets/apple_button.dart';
import 'package:squad/views/login/widgets/email_button.dart';
import 'package:squad/views/login/widgets/email_dialog.dart';
import 'package:squad/views/login/widgets/facebook_button.dart';
import 'package:squad/views/login/widgets/github_button.dart';
import 'package:squad/views/login/widgets/google_button.dart';

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
              onPressed: _onEmailButtonClicked,
            ),
          ],
        ),
      ),
    );
  }

  void _onEmailButtonClicked() {
    showDialog(
      context: context,
      builder: (context) => const EmailDialog(),
    );
  }
}
