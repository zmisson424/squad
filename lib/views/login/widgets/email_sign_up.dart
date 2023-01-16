import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/utils/validators.dart';
import 'package:squad/views/login/bloc/login_bloc.dart';
import 'package:squad/views/login/widgets/password_req.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  final Function() onBack;

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  String? _nameError;

  bool _passwordLengthValidity = false;
  bool _passwordUppercaseValidity = false;
  bool _passwordSpecialCharacterValidity = false;

  @override
  void initState() {
    _passwordController.addListener(_passwordListener);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                  AppLocalizations.of(context)!.createAccount,
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
                controller: _nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (_) {
                  if (_nameError != null) {
                    setState(() {
                      _nameError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: AppLocalizations.of(context)!.name,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    errorText: _nameError),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (_) {
                  if (_emailError != null) {
                    setState(() {
                      _emailError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  errorText: _emailError,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 8,
            ),
            child: SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (_) {
                  if (_passwordError != null) {
                    setState(() {
                      _passwordError = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.password,
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                  ),
                  errorText: _passwordError,
                ),
              ),
            ),
          ),
          PasswordRequirement(
            isValid: _passwordLengthValidity,
            text:
                "${AppLocalizations.of(context)!.passwordRequirementMustContain}5${AppLocalizations.of(context)!.passwordRequirementLength}",
          ),
          PasswordRequirement(
            isValid: _passwordUppercaseValidity,
            text:
                "${AppLocalizations.of(context)!.passwordRequirementMustContain}${AppLocalizations.of(context)!.passwordRequirementUppercase}",
          ),
          PasswordRequirement(
            isValid: _passwordSpecialCharacterValidity,
            text:
                "${AppLocalizations.of(context)!.passwordRequirementMustContain}${AppLocalizations.of(context)!.passwordRequirementSpecial}",
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
                onPressed: () => _handleCreateAccount(context),
                child: Text(
                  AppLocalizations.of(context)!.create,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _passwordListener() {
    bool length = isPasswordValidLenth(_passwordController.text);
    bool uppercase =
        isPasswordValidUppercaseCharacter(_passwordController.text);
    bool special = isPasswordValidSpecialCharacter(_passwordController.text);

    setState(() {
      _passwordLengthValidity = length;
      _passwordSpecialCharacterValidity = special;
      _passwordUppercaseValidity = uppercase;
    });
  }

  void _handleCreateAccount(BuildContext context) {
    bool validEmail = true;
    bool validName = true;

    // Check Name
    if (_nameController.text.isEmpty) {
      validName = false;
      setState(() {
        _nameError = AppLocalizations.of(context)!.invalidNameError;
      });
    }

    // Check Email
    if (!isValidEmailAddress(_emailController.text)) {
      validEmail = false;
      setState(() {
        _emailError = AppLocalizations.of(context)!.invalidEmailError;
      });
    }

    // Check Password
    if (!_passwordLengthValidity) {
      setState(() {
        _passwordError =
            AppLocalizations.of(context)!.invalidPasswordLengthError;
      });
    } else if (!_passwordUppercaseValidity) {
      setState(() {
        _passwordError =
            AppLocalizations.of(context)!.invalidPasswordUppercaseError;
      });
    } else if (!_passwordSpecialCharacterValidity) {
      setState(() {
        _passwordError =
            AppLocalizations.of(context)!.invalidPasswordSpecialError;
      });
    }

    if (validEmail &&
        validName &&
        _passwordLengthValidity &&
        _passwordUppercaseValidity &&
        _passwordSpecialCharacterValidity) {
      context.read<LoginBloc>().add(
            CreateAccountWithEmail(
                email: _emailController.text,
                password: _passwordController.text,
                name: _nameController.text),
          );
    }
  }
}
