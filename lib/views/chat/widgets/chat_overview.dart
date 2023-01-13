import 'package:flutter/material.dart';
import 'package:squad/views/chat/widgets/empty_chat.dart';

class ChatOverview extends StatelessWidget {
  const ChatOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: SizedBox(
        child: EmptyChat(),
      ),
    );
  }
}
