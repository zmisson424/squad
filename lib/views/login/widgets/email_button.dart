import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';
import 'package:squad/views/login/widgets/email_dialog.dart';

class EmailLoginButton extends StatelessWidget {
  const EmailLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: () => _onEmailButtonClicked(context),
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
