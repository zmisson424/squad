import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailSignIn extends StatelessWidget {
  const EmailSignIn({
    Key? key,
    required this.onCreate,
    required this.onForgot,
  }) : super(key: key);

  final Function() onCreate;

  final Function() onForgot;

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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange.shade500,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // TODO
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context)!.signIn,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 18,
            ),
            child: TextButton(
              onPressed: onCreate,
              child: Text(
                AppLocalizations.of(context)!.createAccount,
              ),
            ),
          ),
          TextButton(
            onPressed: onForgot,
            child: Text(
              AppLocalizations.of(context)!.forgotPassword,
            ),
          ),
        ],
      ),
    );
  }
}
