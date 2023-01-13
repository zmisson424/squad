import 'package:flutter/material.dart';

class FullToolBar extends StatelessWidget {
  const FullToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => print("TODO"),
          icon: Icon(Icons.format_bold),
        ),
        IconButton(
          onPressed: () => print("TODO"),
          icon: Icon(Icons.format_italic),
        ),
        IconButton(
          onPressed: () => print("TODO"),
          icon: Icon(Icons.format_underline),
        ),
      ],
    );
  }
}
