import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "BiblioTech",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                "Mes lectures",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onPrimary,
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
                icon: Icon(
                  Icons.search,
                  size: 28,
                  color: Theme.of(context).colorScheme.onPrimary,
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
                icon: Icon(
                  Icons.notifications,
                  size: 28,
                  color: Theme.of(context).colorScheme.onPrimary,
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

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  double availableScreenWidth = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;

    return Column(
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
              Row(
                children: [
                  Text("Livres",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                  const SizedBox(width: 10),
                  Text("7/35",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
              Text("Upgrade",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary))
            ],
          ),
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
            Text(
              "Ajoutés récemment",
              style: Theme.of(context).textTheme.titleLarge,
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
                    "Meurtre au champagne", "Sébastien Theveny"),
              ],
            ),
            const Divider(
              height: 20,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Lecture en cours",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            buildBookRow('La rose de minuit'),
            buildBookRow('L\'étoile du désert'),
            buildBookRow('Le festin'),
          ],
        )),
      ],
    );
  }

  Container buildBookRow(String bookTitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(90),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/icone_livre_48.png'),
              Text(
                bookTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
              color: Theme.of(context).colorScheme.surface,
            ),
            height: 110,
            child: Image.asset('assets/images/icone_livre_256.png')),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: availableScreenWidth * .31,
          child: Text(
            overflow: TextOverflow.ellipsis,
            bookTitle,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
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
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 12),
        ),
      ],
    );
  }
}
