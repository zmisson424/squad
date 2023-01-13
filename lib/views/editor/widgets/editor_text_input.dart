import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditorTextInput extends StatelessWidget {
  const EditorTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: AppLocalizations.of(context)!.emptyMessageHint,
        ),
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
