import 'package:flutter/material.dart';

class BookAddView extends StatelessWidget {
  const BookAddView({super.key});

  static const routeName = '/book/add';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ajoute un livre'),
      ),
    );
  }
}
