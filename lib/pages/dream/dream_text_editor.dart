import 'package:flutter/material.dart';
import 'package:marnie/models/dream.dart';
import 'package:provider/provider.dart';

class DreamTextEditor extends StatefulWidget {
  const DreamTextEditor(this.initialText, {Key? key}) : super(key: key);
  final String initialText;

  @override
  _DreamTextEditorState createState() => _DreamTextEditorState();
}

class _DreamTextEditorState extends State<DreamTextEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    this._controller = TextEditingController(text: widget.initialText);
    this._controller.addListener(() {
      final dream = Provider.of<EditableDream>(context, listen: false);
      String text = _controller.text;
      List<String> splitText = text.split("\n");

      String title = splitText[0];
      splitText.removeAt(0);
      String dreamText = splitText.join("\n");

      dream.setTitle(title);
      dream.setText(dreamText);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 0)
      ),
    );
  }
}
