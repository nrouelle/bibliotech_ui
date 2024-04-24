import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:ma_biblio/src/books/book.dart';

class BooksService {
  Future<List<Book>> getBooks() async {
    List<Book> bookList;

    var file = await _localFile;
    String jsonLibrary = await file.readAsString();
    var rest = json.decode(jsonLibrary) as List;
    bookList = rest.map<Book>((bookJson) => Book.fromJson(bookJson)).toList();
    return bookList;
  }

  Future<void> addBook(String title, String author, String year) async {
    final file = await _localFile;
    var library = await getBooks();
    var newBook = Book(title, author, DateTime.now().year.toString(), false);
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
    return File('$path/myLib.json');
  }
}
