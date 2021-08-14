import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
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
      dream.setTitle(_controller.text);
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
    );
  }
}
