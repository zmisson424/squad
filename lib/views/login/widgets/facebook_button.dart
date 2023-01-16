import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/constants/images.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: SizedBox(
        width: 250,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B5998),
            shadowColor: Theme.of(context).colorScheme.shadow,
            elevation: 2,
          ),
          child: Row(
            children: [
              Image.asset(
                Images.facebookLogo,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                ),
                child: Text(
                  AppLocalizations.of(context)!.facebookSignIn,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
