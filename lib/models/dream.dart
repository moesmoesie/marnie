import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class Dream {
  final String? _id;
  final String title;
  final String text;

  Dream(this._id, {this.title = "", this.text = "text"});
  String? get id => _id;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'text': this.text,
    };
  }

  static Dream fromMap(Map<String, dynamic> map) {
    return Dream(
      map["id"],
      title: map["title"],
      text: map["text"],
    );
  }

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
    if(this.text != text){
      this.text = text;
      notifyListeners();
    }
  }

  void setTitle(String title) {
    if(title != this.title){
      this.title = title;
      notifyListeners();
    }

  }

  Dream generateDream() {
    String id = this.isNewDream ? Uuid().v1() : this.originialDream!._id!;
    return Dream(id, title: this.title, text: this.text);
  }
}
