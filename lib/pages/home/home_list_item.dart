import 'package:flutter/material.dart';
import 'package:marnie/models/dream.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({required this.dream, Key? key }) : super(key: key);
  final Dream dream;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dream.title),
            Text(dream.text)
          ],
        ),
      ),
    );
  }
}