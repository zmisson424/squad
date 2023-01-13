import 'package:flutter/material.dart';
import 'package:squad/constants/constraints.dart';
import 'package:squad/views/app_bars/views/desktop_app_bar.dart';
import 'package:squad/views/chat/chat.dart';
import 'package:squad/views/drawers/views/desktop_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < moblieBreakPoint) {
          // This will be mobile view
          return const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text('Mobile View'),
            ),
          );
        }

        // Else return Desktop / Tablet View

        return SizedBox(
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
        );
      },
    ));
  }
}
