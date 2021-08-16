import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
import 'package:marnie/pages/dream/dream_page.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({Key? key}) : super(key: key);

  void navigateToDreamPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (oldContext) => ChangeNotifierProvider.value(
          value: Provider.of<DreamModel>(context),
          child: DreamPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () => navigateToDreamPage(context));
  }
}
