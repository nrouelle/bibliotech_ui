import 'package:flutter/material.dart';
import 'package:ma_biblio/src/home/widgets/home_widget.dart';
import 'package:ma_biblio/src/library/library_view.dart';
import 'package:ma_biblio/src/library_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    retrieveLibraryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: <Widget>[const HomeWidget(), const LibraryView()][selectedIndex],
      bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          indicatorColor: Theme.of(context).colorScheme.onBackground,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
            NavigationDestination(
                icon: Icon(Icons.library_books), label: 'Bibliothèque'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Recherche'),
          ]),
    );
  }

  void retrieveLibraryData() async {
    await Provider.of<LibraryModel>(context, listen: false).loadLibrary();
  }
}
