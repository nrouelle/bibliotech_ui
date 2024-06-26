import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ma_biblio/src/library/library_header.dart';
import 'package:ma_biblio/src/library_model.dart';
import 'package:provider/provider.dart';
import '../books/books_detail_view.dart';
import 'book.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  static const routeName = '/books';

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LibraryHeader(),
        Expanded(child: Consumer<LibraryModel>(
          builder: (context, library, child) {
            return ListView.builder(
                itemCount: library.books.length,
                itemBuilder: (context, index) {
                  Book book = library.books[index];
                  return Slidable(
                    key: Key(book.uid),
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          removeBook(book);
                        },
                        backgroundColor: const Color.fromARGB(255, 233, 51, 10),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ]),
                    child: GestureDetector(
                      child: ListTile(
                        title: Text(
                          book.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(book.author),
                        tileColor:
                            Theme.of(context).colorScheme.primary.withAlpha(80),
                        shape: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2)),
                      ),
                      onTap: () {
                        // push navigation to details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BooksDetailView(book: library.books[index])),
                        );
                      },
                    ),
                  );
                });
          },
        )),
      ],
    );
  }

  void removeBook(Book book) async {
    await Provider.of<LibraryModel>(context, listen: false).removeBook(book);
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
