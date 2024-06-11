import 'package:flutter/material.dart';
import 'package:to_do_list/models/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }
}
