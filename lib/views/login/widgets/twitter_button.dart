import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/constants/images.dart';
import 'package:squad/custom_options.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';

class TwitterLoginButton extends StatelessWidget {
  const TwitterLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!CustomOptions.allowTwitterSignIn) {
      return Container();
    }
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, sate) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
        child: SizedBox(
          width: 250,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(TwitterLoginAttempt());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1DA1F2),
              shadowColor: Theme.of(context).colorScheme.shadow,
              elevation: 2,
            ),
            child: Row(
              children: [
                Image.asset(
                  Images.twitterLogo,
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.twitterSignIn,
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
    });
  }
}