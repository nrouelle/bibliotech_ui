import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:ma_biblio/src/library/book.dart';

class LibraryService {
  Future<List<Book>> getBooks() async {
    List<Book> bookList = [];

    try {
      var file = await _localFile;
      String jsonLibrary = await file.readAsString();
      var rest = json.decode(jsonLibrary) as List;
    } on Exception catch (ex) {}
    return bookList;
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
