import 'package:flutter/material.dart';
import 'package:marnie/pages/home/home_app_bar.dart';
import 'package:marnie/pages/home/home_fab.dart';

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
      appBar: HomeAppBar(),
      body: HomeListView(),
      floatingActionButton: HomeFloatingActionButton(),
    );
  }
}
