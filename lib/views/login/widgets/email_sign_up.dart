import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailSignUp extends StatelessWidget {
  const EmailSignUp({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  final Function() onBack;

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
                onPressed: onBack,
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
              height: 48,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.name,
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: AppLocalizations.of(context)!.email,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
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
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                  ),
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
                  AppLocalizations.of(context)!.create,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
