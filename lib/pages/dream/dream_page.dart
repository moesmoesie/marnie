import 'package:flutter/material.dart';
import 'package:marnie/models/dream_model.dart';
import 'package:provider/provider.dart';

import 'dream_app_bar.dart';
import 'dream_body.dart';

class DreamPage extends StatelessWidget {
  const DreamPage(this.dream, {Key? key}) : super(key: key);
  final Dream dream;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditableDream.fromDream(dream),
      child: Scaffold(
        appBar: DreamAppBar(),
        body: DreamBody(),
      ),
    );
  }
}
