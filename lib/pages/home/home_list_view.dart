import 'package:flutter/material.dart';
import 'package:marnie/models/dream.dart';
import 'package:marnie/stores/dream_store.dart';
import 'package:marnie/pages/dream/dream_page.dart';
import 'package:provider/provider.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({Key? key}) : super(key: key);

  void navigateToDreamPage(BuildContext context, Dream dream) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (oldContext) => ChangeNotifierProvider.value(
          value: Provider.of<DreamStore>(context),
          child: DreamPage(dream: dream),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dreamModel = Provider.of<DreamStore>(context);
    return FutureBuilder<List<Dream>>(
        future: dreamModel.dreams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final dreams = snapshot.data!;
            return ListView.builder(
              itemCount: dreams.length,
              itemBuilder: (context, index) {
                final dream = dreams[index];
                return ListTile(
                  title: Text(dream.title),
                  onTap: () => navigateToDreamPage(context, dream),
                );
              },
            );
          } else {
            return Center(
              child: Text("Loading..."),
            );
          }
        });
  }
}
