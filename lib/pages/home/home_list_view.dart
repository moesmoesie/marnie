import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
import 'package:marnie/pages/dream/dream_page.dart';
import 'package:provider/provider.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key}) : super(key: key);

  void navigateToDreamPage(BuildContext context, Dream dream) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (oldContext) => ChangeNotifierProvider.value(
          value: Provider.of<DreamModel>(context),
          child: DreamPage(dream: dream),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dreamModel = Provider.of<DreamModel>(context);
    return ListView.builder(
      itemCount: dreamModel.dreamCount,
      itemBuilder: (context, index) {
        final dream = dreamModel.dreams[index];
        return ListTile(
          title: Text(dream.title),
          onTap: () => navigateToDreamPage(context, dream),
        );
      },
    );
  }
}
