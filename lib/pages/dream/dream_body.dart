import 'package:flutter/material.dart';
import 'package:marnie/models/dream.dart';
import 'package:provider/provider.dart';

import 'dream_text_editor.dart';

class DreamBody extends StatefulWidget {
  const DreamBody({Key? key}) : super(key: key);

  @override
  _DreamBodyState createState() => _DreamBodyState();
}

class _DreamBodyState extends State<DreamBody> {
  @override
  Widget build(BuildContext context) {
    final EditableDream dream = Provider.of<EditableDream>(context);
    return Container(
      padding: EdgeInsets.all(0),
      child: DreamTextEditor([dream.title,dream.text].join("\n"),),
    );
  }
}
