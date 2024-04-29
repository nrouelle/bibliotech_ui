import 'package:flutter/material.dart';
import 'package:ma_biblio/src/books/books_add_view.dart';
import 'package:ma_biblio/src/settings/settings_view.dart';

import 'package:ma_biblio/src/books/books_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [const Header()],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      alignment: Alignment.center,
      height: 170,
      decoration: BoxDecoration(color: Colors.blue.shade600),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "BiblioTech",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Mes lectures",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Row(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(.1),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(.1),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class CurrentBook extends StatelessWidget {
  const CurrentBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Livre en cours de lecture');
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Page en attente !');
  }
}
