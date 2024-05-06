import 'book.dart';
import './library_service.dart';

class LibraryController {
  LibraryController(this._libraryService);

  final LibraryService _libraryService;

  late List<Book> _booksList;

  List<Book> get books => _booksList;

  Future<List<Book>> loadBooks() async {
    _booksList = await _libraryService.getBooks();
    return _booksList;
  }

  Future<void> saveLibrary(
      String title, String author, String year, bool read) async {
    await _libraryService.addBook(title, author, year, read);
  }
}
