import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
import 'package:provider/provider.dart';

class DreamAppBar extends StatefulWidget implements PreferredSizeWidget {
  DreamAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _DreamAppBarState createState() => _DreamAppBarState();
}

class _DreamAppBarState extends State<DreamAppBar> {
  void saveDream(BuildContext context) {
    final dream = Provider.of<EditableDream>(context, listen: false);
    final dreamModel = Provider.of<DreamModel>(context, listen: false);
    if (dream.id != null) {
      dreamModel.update(Dream(dream.id!, dream.title, text: dream.text));
    }
    Navigator.pop(context);
  }

  void deleteDream(BuildContext context) {
    final dream = Provider.of<EditableDream>(context, listen: false);
    final dreamModel = Provider.of<DreamModel>(context, listen: false);
    if (dream.id != null) {
      dreamModel.remove(dream.originialDream!);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final EditableDream dream = Provider.of<EditableDream>(context);
    return AppBar(
      title: Text(dream.title),
      actions: [
        IconButton(
          onPressed: () => saveDream(context),
          icon: Icon(Icons.save),
        ),
        IconButton(
          onPressed: () => deleteDream(context),
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}
