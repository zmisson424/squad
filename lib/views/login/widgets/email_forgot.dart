import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/utils/validators.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';

class EmailForgot extends StatefulWidget {
  const EmailForgot({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  final Function() onBack;

  @override
  State<EmailForgot> createState() => _EmailForgotState();
}

class _EmailForgotState extends State<EmailForgot> {
  final TextEditingController _emailController = TextEditingController();

  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: widget.onBack,
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 48,
                ),
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: SizedBox(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    errorText: _emailError),
                onChanged: (_) {
                  if (_emailError != null) {
                    setState(() {
                      _emailError = null;
                    });
                  }
                },
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
                onPressed: () => _handleForgotEmail(context),
                child: Text(
                  AppLocalizations.of(context)!.sendResetEmail,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleForgotEmail(BuildContext context) {
    // Check Email
    if (isValidEmailAddress(_emailController.text)) {
      context
          .read<LoginBloc>()
          .add(ForgotPassword(email: _emailController.text));
      Navigator.of(context).pop();
    } else {
      setState(() {
        _emailError = AppLocalizations.of(context)!.invalidEmailError;
      });
    }
  }
}
