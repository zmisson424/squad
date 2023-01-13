import 'package:flutter/material.dart';
import 'package:squad/views/chat/widgets/chat_overview.dart';
import 'package:squad/views/editor/views/desktop_editor.dart';

class ChatDisplay extends StatelessWidget {
  const ChatDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          ChatOverview(),
          DesktopEditor(),
        ],
      ),
    );
  }
}
