import 'dart:collection';
import 'package:flutter/material.dart';

class DreamModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<Dream> _dreams = [
    Dream(0, "title0"),
    Dream(1, "title1"),
    Dream(2, "title2"),
    Dream(3, "title3"),
    Dream(4, "title4"),
    Dream(5, "title5"),
  ];

  UnmodifiableListView<Dream> get dreams => UnmodifiableListView(_dreams);
  int get dreamCount => _dreams.length;

  void add(Dream item) {
    _dreams.add(item);
    notifyListeners();
  }

  void update(Dream dream) {
    final int index = _dreams.indexOf(dream);
    _dreams[index] = dream;
    notifyListeners();
  }

  /// Removes all items from the cart.
  void remove(Dream dream) {
    _dreams.remove(dream);
    notifyListeners();
  }
}

@immutable
class Dream {
  final int id;
  final String title;
  final String text;

  Dream(this.id, this.title, {this.text = "text"});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Dream && other.id == id;
}

class EditableDream with ChangeNotifier {
  int? id;
  Dream? dream;
  String title = "";
  String text = "";

  EditableDream({this.id, this.title = "", this.text = ""});

  EditableDream.fromDream(Dream dream) {
    this.title = dream.title;
    this.text = dream.text;
    this.id = dream.id;
    this.dream = dream;
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
