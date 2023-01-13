import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/constants/images.dart';

class GithubLoginButton extends StatelessWidget {
  const GithubLoginButton({
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
          backgroundColor: Colors.grey.shade900,
          shadowColor: Theme.of(context).colorScheme.shadow,
          elevation: 2,
        ),
        child: Row(
          children: [
            Image.asset(
              Images.appleLogo,
              width: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Text(
                AppLocalizations.of(context)!.githubSignIn,
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
