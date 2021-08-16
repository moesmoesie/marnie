import 'package:flutter/material.dart';
import 'package:marnie/pages/home/home_page.dart';
import 'package:marnie/stores/dream_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marnie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => DreamStore(),
        builder: (context, snapshot) {
          return HomePage();
        },
      ),
    );
  }
}
