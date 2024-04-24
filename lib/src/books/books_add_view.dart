import 'package:flutter/material.dart';
import 'package:ma_biblio/src/books/books_controller.dart';
import 'package:ma_biblio/src/books/books_list_view.dart';
import 'package:ma_biblio/src/books/books_service.dart';
import 'package:ma_biblio/src/home/home_view.dart';

class BookAddView extends StatefulWidget {
  const BookAddView({super.key});

  static const routeName = '/book/add';

  @override
  BookAddForm createState() {
    return BookAddForm();
  }
}

class BookAddForm extends State<BookAddView> {
  final _addFormKey = GlobalKey<FormState>();
  final BooksController controller = BooksController(BooksService());

  String title = '';
  String author = '';
  String year = '';
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text =
        DateTime.now().year.toString(); //set the initial value of text field
    super.initState();
  }

  void saveBook() {
    controller.saveLibrary(title, author, year);
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2026));
    if (picked != null) setState(() => dateInput.text = picked.year.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addFormKey,
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
              child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  title = value as String;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Entrez le titre du livre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez indiquer le titre du livre';
                  }
                  return null;
                },
              ),
              TextFormField(
                onSaved: (value) {
                  author = value as String;
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Entrez l\'auteur du livre'),
              ),
              TextFormField(
                controller: dateInput,
                readOnly: true,
                onSaved: (value) {
                  year = value as String;
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate();
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Année de lecture'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_addFormKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        _addFormKey.currentState?.save();
                        saveBook();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        Navigator.pushNamed(context, '/');
                      }
                    },
                    child: const Text('Ajouter')),
              ),
            ],
          ))),
    );
  }
}
