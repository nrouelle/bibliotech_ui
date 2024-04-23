import 'package:flutter/material.dart';
import 'package:ma_biblio/src/books/books_service.dart';
import 'book.dart';
import 'books_controller.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  static const routeName = '/books';

  @override
  State<BookListView> createState() => _MyBookListViewState();
}

class _MyBookListViewState extends State<BookListView> {
  final BooksController controller = BooksController(BooksService());

  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = controller.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder<List<Book>>(
                future: controller.loadBooks(),
                builder: (context, snapshot) {
                  List<Book>? books = snapshot.data;
                  if (books != null &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: books!.length,
                      itemBuilder: (context, index) {
                        Book book = books[index];
                        return BookItem(
                          title: book.title,
                          author: book.author,
                          read: (book.read
                              ? Colors.green[900]
                              : Colors.grey[300]),
                        );
                      },
                    );
                  }

                  /// handles others as you did on question
                  else {
                    return CircularProgressIndicator();
                  }
                })));
  }
}

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.title,
    required this.author,
    required this.read,
  });

  final String title;
  final String author;
  final Color? read;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            Icons.book,
            color: Colors.blue[300],
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(author),
                    ],
                  ))),
          // Icon read
          Icon(
            Icons.check_circle,
            color: read,
          ),
        ],
      ),
    );
  }
}
