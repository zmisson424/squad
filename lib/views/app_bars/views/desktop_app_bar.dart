import 'package:flutter/material.dart';

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12,
        ),
        child: Row(
          children: const [
            Text(
              'Sample Text Header',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
