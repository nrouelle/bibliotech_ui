import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ma_biblio/src/books/books_service.dart';
import 'package:ma_biblio/src/settings/settings_view.dart';
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
    // TODO: implement initState
    super.initState();
    futureBooks = controller.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ma bibliotheque'),
          actions: [
            IconButton(
              icon: const Icon(Icons.library_books),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, BookListView.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Center(
            child: FutureBuilder<List<Book>>(
                future: futureBooks,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data?[index].title ?? "got null");
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
  final Bool read;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Icon(
            Icons.book,
            color: Colors.blue[300],
          ),
          // Text
          const Text('toto'),
          // Icon read
          Icon(
            Icons.check_circle,
            color: Colors.green[600],
          ),
        ],
      ),
    );
  }
}
