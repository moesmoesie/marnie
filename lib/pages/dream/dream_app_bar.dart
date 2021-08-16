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
  @override
  Widget build(BuildContext context) {
    final EditableDream dream = Provider.of<EditableDream>(context);
    return AppBar(
      title: Text(dream.title),
      actions: [
        dream.isNewDream ? _SaveButton() : _UpdateButton(),
        _DeleteButton(),
      ],
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    Key? key,
  }) : super(key: key);

  void deleteDream(BuildContext context) {
    final dream = Provider.of<EditableDream>(context, listen: false);
    final dreamModel = Provider.of<DreamModel>(context, listen: false);
    if (!dream.isNewDream) {
      dreamModel.remove(dream.originialDream!);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => deleteDream(context),
      icon: Icon(Icons.delete),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  void addDream(BuildContext context) {
    final dream = Provider.of<EditableDream>(context, listen: false);
    final dreamModel = Provider.of<DreamModel>(context, listen: false);
    dreamModel.add(dream.generateDream());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => addDream(context),
      icon: Icon(Icons.save),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({
    Key? key,
  }) : super(key: key);

  void updateDream(BuildContext context) {
    final dream = Provider.of<EditableDream>(context, listen: false);
    final dreamModel = Provider.of<DreamModel>(context, listen: false);
    dreamModel.update(dream.generateDream());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => updateDream(context),
      icon: Icon(Icons.save),
    );
  }
}
