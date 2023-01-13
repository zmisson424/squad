import 'package:flutter/material.dart';

class FullToolBar extends StatelessWidget {
  const FullToolBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ToolBarIconButton(
          icon: Icons.format_bold_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.format_italic_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.format_underline_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.format_strikethrough_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.link_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.format_list_numbered_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.format_list_bulleted_outlined,
          onPressed: () => print('TODO'),
        ),
        _ToolBarIconButton(
          icon: Icons.code,
          onPressed: () => print('TODO'),
        ),
      ],
    );
  }
}

class _ToolBarIconButton extends StatelessWidget {
  final IconData icon;

  final Function() onPressed;

  const _ToolBarIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 20,
    );
  }
}
