import 'package:flutter/material.dart';
import 'package:squad/views/login/widgets/email_sign_in.dart';
import 'package:squad/views/login/widgets/email_sign_up.dart';

enum EmailState { signIn, signUp, forgotPassword }

class EmailDialog extends StatefulWidget {
  const EmailDialog({Key? key}) : super(key: key);

  @override
  State<EmailDialog> createState() => _EmailDialogState();
}

class _EmailDialogState extends State<EmailDialog> {
  EmailState emailState = EmailState.signIn;

  @override
  Widget build(BuildContext context) {
    return Dialog(child: buildChild());
  }

  Widget buildChild() {
    switch (emailState) {
      case EmailState.signIn:
        return EmailSignIn(
          onCreate: () {
            setState(() {
              emailState = EmailState.signUp;
            });
          },
          onForgot: () {
            setState(() {
              emailState = EmailState.forgotPassword;
            });
          },
        );
      case EmailState.signUp:
        return EmailSignUp(
          onBack: () {
            setState(() {
              emailState = EmailState.signIn;
            });
          },
        );
      case EmailState.forgotPassword:
        return Container();
    }
  }
}
