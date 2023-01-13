import 'package:flutter/material.dart';
import 'package:squad/views/drawers/views/mobile_drawer.dart';

class MobileHomeView extends StatefulWidget {
  const MobileHomeView({Key? key}) : super(key: key);

  @override
  State<MobileHomeView> createState() => _MobileHomeViewState();
}

class _MobileHomeViewState extends State<MobileHomeView> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: _selectedView(),
        ),
      ),
      bottomNavigationBar: MobileDrawer(
        selected: selected,
        onPressed: (value) {
          setState(() {
            selected = value;
          });
        },
      ),
    );
  }

  Widget _selectedView() {
    if (selected == 0) {
      return const Text(
        'Direct Message',
      );
    }

    if (selected == 1) {
      return const Text(
        'Channels',
      );
    }

    if (selected == 2) {
      return const Text(
        'Profile Settings',
      );
    }

    return Container();
  }
}
