import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/constants/images.dart';
import 'package:squad/custom_options.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!CustomOptions.allowGoogleSignIn) {
      return Container();
    }

    return BlocBuilder<LoginBloc, LoginState>(builder: ((context, state) {
      return SizedBox(
        width: 250,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(GoogleLoginAttempt());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Theme.of(context).colorScheme.shadow,
            elevation: 2,
          ),
          child: Row(
            children: [
              Image.asset(
                Images.googleLogo,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Text(
                  AppLocalizations.of(context)!.googleSignIn,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
