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
      Iterable list = json.decode(jsonLibrary);
      bookList = List<Book>.from(list.map((book) => Book.fromJson(book)));
    } on Exception catch (ex) {
      throw Exception('Failed to load data');
    }
    return bookList;
  }

  Future<void> addBook(
      String title, String author, String year, bool read) async {
    final file = await _localFile;
    var library = await getBooks();
    var newBook = Book(title, author, DateTime.now(), read);
    library.add(newBook);

    var jsonLibrary = jsonEncode(library);
    file.writeAsString(jsonLibrary);
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
