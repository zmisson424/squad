import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'Mobile View',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.message,
            ),
            label: AppLocalizations.of(context)!.personalMessages,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.group,
            ),
            label: AppLocalizations.of(context)!.channels,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
