import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
import 'package:provider/provider.dart';

import 'home_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marnie"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => DreamModel(),
        child: HomeListView(),
      ),
    );
  }
}
