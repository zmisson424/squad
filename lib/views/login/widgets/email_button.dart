import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailLoginButton extends StatelessWidget {
  const EmailLoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade700,
          shadowColor: Theme.of(context).colorScheme.shadow,
          elevation: 2,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.email,
              size: 20,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 34,
              ),
              child: Text(
                AppLocalizations.of(context)!.emailSignIn,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
