import 'package:flutter/material.dart';
import 'package:squad/constants/constraints.dart';
import 'package:squad/views/app_bars/views/desktop_app_bar.dart';
import 'package:squad/views/chat/chat.dart';
import 'package:squad/views/drawers/views/desktop_drawer.dart';
import 'package:squad/views/home/view/desktop_home_view.dart';
import 'package:squad/views/home/view/mobile_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile Layout
        if (constraints.maxWidth < moblieBreakPoint) {
          return const MobileHomeView();
        }

        // Desktop / Tablet Layout
        return const DesktopHomeView();
      },
    );
  }
}
