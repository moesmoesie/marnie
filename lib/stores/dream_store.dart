import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:marnie/local_database.dart';
import 'package:marnie/models/dream.dart';

class DreamStore extends ChangeNotifier {
  final Future<LocalDatabase> _localDatabase = LocalDatabase.loadDatabase();

  Future<UnmodifiableListView<Dream>> get dreams async {
    final db = await _localDatabase;
    return UnmodifiableListView(await db.loadDreams());
  }

  Future<void> add(Dream dream) async {
    final db = await _localDatabase;
    db.insertDream(dream);
    notifyListeners();
  }

  Future<void> update(Dream dream) async {
    final db = await _localDatabase;
    db.insertDream(dream);
    notifyListeners();
  }

  Future<void> remove(Dream dream) async {
    final db = await _localDatabase;
    await db.deleteDream(dream);
    notifyListeners();
  }
}
