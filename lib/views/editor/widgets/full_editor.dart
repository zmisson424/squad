import 'package:flutter/material.dart';
import 'package:squad/theme/colors.dart';
import 'package:squad/views/editor/widgets/editor_text_input.dart';
import 'package:squad/views/editor/widgets/full_tools_row.dart';

class FullEditor extends StatefulWidget {
  const FullEditor({Key? key}) : super(key: key);

  @override
  State<FullEditor> createState() => _FullEditorState();
}

class _FullEditorState extends State<FullEditor> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const FullToolBar(),
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: EditorTextInput(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: IconButton(
                      onPressed: () => print("TODO"),
                      icon: const Icon(
                        Icons.send,
                      ),
                      color: drawerColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
