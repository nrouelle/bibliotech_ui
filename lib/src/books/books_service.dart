import 'dart:async';
import 'dart:ffi';

import 'package:ma_biblio/src/books/book.dart';

class BooksService {
  FutureOr<List<Book>> getBooks() async {
    final List<Book> bookList;

    bookList = const [
      Book('L\'etoile du désert', 'Harry Bosch', '2024', true),
      Book('Noise', 'Daniel Kanheman', '2024', false)
    ];
    return bookList;
    // retrieve list of books read
    throw Exception("no books found");
  }
}
