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

  Future<void> saveLibrary(
      String title, String author, String year, bool read) async {
    await _booksService.addBook(title, author, year, read);
  }
}
