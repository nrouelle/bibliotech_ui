import 'package:flutter/material.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});

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
                  Icons.add,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/book/add');
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
