import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DreamModel extends ChangeNotifier {
  List<Dream> _dreams = [
    Dream(Uuid(), title: "title0"),
    Dream(Uuid(), title: "title1"),
    Dream(Uuid(), title: "title2"),
    Dream(Uuid(), title: "title3"),
    Dream(Uuid(), title: "title4"),
    Dream(Uuid(), title: "title5"),
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
  final Uuid? _id;
  final String title;
  final String text;

  Dream(this._id, {this.title = "", this.text = "text"});
  Uuid? get id => _id;

  @override
  int get hashCode => _id.hashCode;

  @override
  bool operator ==(Object other) => other is Dream && other._id == _id;
}

class EditableDream with ChangeNotifier {
  Dream? originialDream;
  String title = "";
  String text = "";

  EditableDream({this.title = "", this.text = ""});
  bool get isNewDream => originialDream == null;

  EditableDream.fromDream(Dream dream) {
    this.title = dream.title;
    this.text = dream.text;
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

  Dream generateDream() {
    Uuid id = this.isNewDream ? Uuid() : this.originialDream!._id!;
    return Dream(id, title: this.title, text: this.text);
  }
}
