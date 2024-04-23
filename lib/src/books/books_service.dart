import 'dart:async';

import 'package:ma_biblio/src/books/book.dart';

class BooksService {
  FutureOr<List<Book>> getBooks() async {
    final List<Book> bookList;

    bookList = const [
      Book('Letoile du désert', 'Harry Bosch', '2024'),
      Book('Noise', 'Daniel Kanheman', '2024')
    ];
    return bookList;
    // retrieve list of books read
    throw Exception("no books found");
  }
}
