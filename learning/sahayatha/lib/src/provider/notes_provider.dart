import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sahayatha/src/model/notes_model.dart';

class NoteProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => [..._notes];

  // Initialize shared preferences
  late SharedPreferences _prefs;

  NoteProvider() {
    _loadNotes(); // Load notes from shared preferences when provider is initialized
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadNotes() async {
    await _initPrefs();
    final List<String>? notesStringList = _prefs.getStringList('notes');
    if (notesStringList != null) {
      _notes.clear();
      _notes.addAll(notesStringList
          .map((noteString) => Note.fromJson(jsonDecode(noteString))));
      notifyListeners();
    }
  }

  void _saveNotes() {
    final List<String> notesStringList =
        _notes.map((note) => jsonEncode(note.toJson())).toList();
    _prefs.setStringList('notes', notesStringList);
  }

  void addNote(Note note) {
    _notes.add(note);
    _saveNotes(); // Save notes to shared preferences when a note is added
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    _saveNotes(); // Save notes to shared preferences after deleting a note
    notifyListeners();
  }
}
