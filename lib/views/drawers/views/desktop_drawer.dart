import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:squad/constants/constraints.dart';
import 'package:squad/theme/colors.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 16,
        right: 16,
      ),
      width: desktopDrawerWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        color: drawerColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              AppLocalizations.of(context)!.appName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: drawerFontColor,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.personalMessages,
                style: TextStyle(
                  fontSize: 16,
                  color: drawerFontColor,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
                color: drawerFontColor,
                iconSize: 18,
                onPressed: () {
                  // TODO
                },
              )
            ],
          ),
          Divider(
            color: drawerFontColor,
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.channels,
                style: TextStyle(
                  fontSize: 16,
                  color: drawerFontColor,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
                color: drawerFontColor,
                iconSize: 18,
                onPressed: () {
                  // TODO
                },
              )
            ],
          ),
          Divider(
            color: drawerFontColor,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
