import 'package:flutter/material.dart';
import 'books_detail_view.dart';
import 'books_service.dart';
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
                    books.isNotEmpty &&
                    snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      Book book = books[index];
                      return GestureDetector(
                        child: BookItem(
                          title: book.title,
                          author: book.author,
                        ),
                        onTap: () {
                          // push navigation to details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BooksDetailView(book: books[index])),
                          );
                        },
                      );
                    },
                  );
                } else if (books != null &&
                    books.isEmpty &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('La bibliothèque est vide ...'),
                      ElevatedButton(
                          child: const Text(
                              "Ajoute ton premier livre !"), //click me button
                          onPressed: () {
                            Navigator.pushNamed(context, '/book/add');
                          })
                    ],
                  );
                }

                /// handles others as you did on question
                else {
                  return const CircularProgressIndicator();
                }
              })),
    );
  }
}

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final BooksController controller = BooksController(BooksService());

  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    futureBooks = controller.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: controller.loadBooks(),
        builder: (context, snapshot) {
          List<Book>? books = snapshot.data;
          if (books != null &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                Book book = books[index];
                return GestureDetector(
                    child: BookItem(
                      title: book.title,
                      author: book.author,
                    ),
                    onTap: () {
                      // push navigation to details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BooksDetailView(book: books[index])),
                      );
                    });
              },
            );
          }

          /// handles others as you did on question
          else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.title, required this.author});

  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(author, style: const TextStyle(fontSize: 14)),
                    ],
                  ))),
        ],
      ),
    );
  }
}
