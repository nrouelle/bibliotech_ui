import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ma_biblio/src/books/books_add_view.dart';
import 'package:ma_biblio/src/settings/settings_view.dart';

import 'package:ma_biblio/src/books/books_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double availableScreenWidth = 0;
  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: "Livres",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: "7/50",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300))
                        ])),
                    const Text("Upgrade",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  buildBookNumberChart("Lu", Colors.blue, .3),
                  const SizedBox(
                    width: 2,
                  ),
                  buildBookNumberChart("Non Lu", Colors.orange, .25),
                  const SizedBox(
                    width: 2,
                  ),
                  buildBookNumberChart(
                      "Pour plus tard", Colors.yellow.shade600, .20)
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 20,
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const Text(
                  "Ajoutés récemment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    buildAddRecentlyList("Police", "Jo Nesbo"),
                    SizedBox(
                      width: availableScreenWidth * .03,
                    ),
                    buildAddRecentlyList("Noise", "Daniel Hakehman"),
                    SizedBox(
                      width: availableScreenWidth * .03,
                    ),
                    buildAddRecentlyList(
                        "Meurtre au ch...", "Sébastien Theveny"),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Lecture en cours",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                buildBookRow('Titre du livre'),
                buildBookRow('Titre du livre'),
                buildBookRow('Titre du livre'),
              ],
            )),
          ],
        ));
  }

  Container buildBookRow(String bookTitle) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bookTitle),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }

  Column buildAddRecentlyList(String bookTitle, String author) {
    return Column(
      children: [
        Container(
            width: availableScreenWidth * .31,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade300,
            ),
            height: 110,
            child: Image.asset('assets/images/icone_livre_256.png')),
        const SizedBox(
          height: 15,
        ),
        Text(
          bookTitle,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          author,
          style: const TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Column buildBookNumberChart(
      String title, Color color, double widthPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: availableScreenWidth * widthPercentage,
          height: 4,
          color: color,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
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
