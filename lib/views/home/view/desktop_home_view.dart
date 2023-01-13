import 'package:flutter/material.dart';
import 'package:squad/views/app_bars/views/desktop_app_bar.dart';
import 'package:squad/views/chat/chat.dart';
import 'package:squad/views/drawers/drawers.dart';

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: [
          const DesktopDrawer(),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  DesktopAppBar(),
                  Expanded(
                    child: ChatDisplay(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
