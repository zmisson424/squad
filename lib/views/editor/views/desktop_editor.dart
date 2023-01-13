import 'package:flutter/material.dart';
import 'package:squad/views/editor/widgets/full_editor.dart';

class DesktopEditor extends StatelessWidget {
  const DesktopEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: FullEditor(),
      ),
    );
  }
}
