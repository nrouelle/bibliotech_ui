import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'book.dart';

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
              const ImageSection(imageUrl: 'https://picsum.photos/350/250'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(book.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              Text(
                book.author,
                style: const TextStyle(fontSize: 18),
              ),
              Text(book.year),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.done,
                        weight: 300,
                      ),
                      onPressed: () {
                        // Mark book as read
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        // Share book information
                      },
                    ),
                  ],
                ),
              ),
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
