import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyChat extends StatelessWidget {
  const EmptyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.message_outlined,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            AppLocalizations.of(context)!.emptyChat,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
