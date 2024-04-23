import 'book.dart';
import 'books_service.dart';

class BooksController {
  BooksController(this._booksService);

  final BooksService _booksService;

  late List<Book> _booksList;

  List<Book> get books => _booksList;

  Future<List<Book>> loadBooks() async {
    _booksList = await _booksService.getBooks();
    return _booksList;
  }
}
