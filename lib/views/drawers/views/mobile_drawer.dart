import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    Key? key,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final int selected;

  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selected,
      onTap: onPressed,
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
    );
  }
}
