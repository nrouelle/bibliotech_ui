import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../library/book.dart';

class BooksDetailView extends StatelessWidget {
  const BooksDetailView({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes lectures'),
      ),
      body: Expanded(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      child: Text(book.title[0]),
                    ),
                    Text(book.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 36)),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.done,
                        size: 50.0,
                      ),
                      color: ThemeData().primaryColor,
                      onPressed: () {
                        // Mark book as read
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        size: 50.0,
                      ),
                      color: ThemeData().primaryColor,
                      onPressed: () {
                        // Share book information
                      },
                    ),
                  ],
                ),
              ),
              Text(
                book.author,
                style: const TextStyle(fontSize: 18),
              ),
              (book.readDate != null)
                  ? Text(DateFormat.yMMM().format(book.readDate!))
                  : const Text("Non lu"),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
