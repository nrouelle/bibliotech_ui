import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ma_biblio/src/books/book.dart';

class BooksService {
  Future<List<Book>> getBooks() async {
    List<Book> bookList;

    final String response = await rootBundle.loadString('assets/library.json');
    var data = await json.decode(response);
    var rest = data['library'] as List;
    bookList = rest.map<Book>((bookJson) => Book.fromJson(bookJson)).toList();

    // bookList = [
    //   Book('L\'etoile du désert', 'Harry Bosch', '2024', true),
    //   Book('Noise', 'Daniel Kanheman', '2024', false)
    // ];

    return bookList;
    // retrieve list of books read
    // throw Exception("no books found");
  }
}
