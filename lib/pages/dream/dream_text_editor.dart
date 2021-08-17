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
  late CustomTextEditingController _controller;

  @override
  void initState() {
    this._controller = CustomTextEditingController();
    this._controller.text = widget.initialText;
    this._controller.addListener(() {
      final dream = Provider.of<EditableDream>(context, listen: false);
      String text = _controller.text;
      List<String> splitText = text.split("\n");

      String title = splitText[0];
      splitText.removeAt(0);
      String dreamText = splitText.join("\n");
      dream.setTags(_controller.tags);
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


class CustomTextEditingController extends TextEditingController {
  List<String> tags = [];

  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style , required bool withComposing}) {
    assert(!value.composing.isValid || !withComposing || value.isComposingRangeValid);

    List<String> splitText = value.text.split("\n");
    String title = splitText[0];
    final titleTextSpan = TextSpan(
      text: title,
      style: Theme.of(context).textTheme.headline6
    );

    splitText.removeAt(0);
    final List<InlineSpan> childeren = [titleTextSpan];
    final List<String> tags = [];

    String body = splitText.join("\n");
    body = "\n" + body;
    body.splitMapJoin(
      RegExp(r"\_(.*?)\_"),
      onMatch: (Match match) {
        final formatText = match[0]!.replaceAll("_", "");
        tags.add(formatText.trim());
        final ts = TextSpan(text: formatText, style: Theme.of(context).textTheme.overline);
        childeren.add(ts);
        return "";
      },
      onNonMatch: (String match){
        childeren.add(TextSpan(text: match, style: Theme.of(context).textTheme.bodyText1));
        return "";
      }
    );
    this.tags = tags;

    return TextSpan(children: childeren);
  }
}