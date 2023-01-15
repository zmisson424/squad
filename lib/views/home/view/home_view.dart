import 'package:flutter/material.dart';
import 'package:squad/constants/constraints.dart';
import 'package:squad/views/home/view/desktop_home_view.dart';
import 'package:squad/views/home/view/mobile_home_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeView());
  }

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
