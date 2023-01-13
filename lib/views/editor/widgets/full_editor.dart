import 'package:flutter/material.dart';
import 'package:squad/views/editor/widgets/full_tools_row.dart';

class FullEditor extends StatefulWidget {
  const FullEditor({Key? key}) : super(key: key);

  State<FullEditor> createState() => _FullEditorState();
}

class _FullEditorState extends State<FullEditor> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: const [FullToolBar()],
        ),
      ),
    );
  }
}
