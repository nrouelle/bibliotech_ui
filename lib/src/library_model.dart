import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ma_biblio/src/library/book.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class LibraryModel extends ChangeNotifier {
  List<Book> _books = [];

  LibraryModel() {
    _books = [];
  }
  List<Book> get books => _books;

  Future<void> add(Book book) async {
    _books.add(book);
    var file = await _localFile;

    var jsonLibrary = jsonEncode(_books);
    await file.writeAsString(jsonLibrary, mode: FileMode.write, flush: true);

    notifyListeners();
  }

  Future<void> getLibrary() async {
    try {
      var file = await _localFile;
      String jsonLibrary = await file.readAsString();
      if (jsonLibrary.isNotEmpty) {
        final dynamic list = json.decode(jsonLibrary);

        for (int i = 0; i < list.length; i++) {
          _books.add(Book.fromJson(list[i]));
        }
      }
      notifyListeners();
      // books = List<Book>.from(list.map((book) => Book.fromJson(book)));
    } on Exception catch (ex) {
      throw Exception('Failed to load data');
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var file = File('$path/myLib.json');
    bool doesFileExists = await file.exists();
    if (!doesFileExists) {
      file.create();
    }
    return file;
  }
}
