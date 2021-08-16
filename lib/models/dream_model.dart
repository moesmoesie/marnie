import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DreamModel extends ChangeNotifier {
  List<Dream> _dreams = [
    Dream(Uuid(), "title0"),
    Dream(Uuid(), "title1"),
    Dream(Uuid(), "title2"),
    Dream(Uuid(), "title3"),
    Dream(Uuid(), "title4"),
    Dream(Uuid(), "title5"),
  ];

  UnmodifiableListView<Dream> get dreams => UnmodifiableListView(_dreams);
  int get dreamCount => _dreams.length;

  void add(Dream dream) {
    _dreams.add(dream);
    notifyListeners();
  }

  void update(Dream dream) {
    final int index = _dreams.indexOf(dream);
    _dreams[index] = dream;
    notifyListeners();
  }

  void remove(Dream dream) {
    _dreams.remove(dream);
    notifyListeners();
  }
}

@immutable
class Dream {
  final Uuid id;
  final String title;
  final String text;

  Dream(this.id, this.title, {this.text = "text"});

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is Dream && other.id == id;
}

class EditableDream with ChangeNotifier {
  Uuid? id;
  Dream? originialDream;
  String title = "";
  String text = "";

  EditableDream({this.id, this.title = "", this.text = ""});

  EditableDream.fromDream(Dream dream) {
    this.title = dream.title;
    this.text = dream.text;
    this.id = dream.id;
    this.originialDream = dream;
  }

  void setText(String text) {
    this.text = text;
    notifyListeners();
  }

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }
}
