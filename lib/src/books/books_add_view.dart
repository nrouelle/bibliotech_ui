import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ma_biblio/src/library/book.dart';
import 'package:ma_biblio/src/library_model.dart';
import 'package:provider/provider.dart';

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

  String title = '';
  String author = '';
  DateTime? _selectedDate;
  bool read = false;
  final TextEditingController _dateInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un livre'),
        backgroundColor: Colors.blue[400],
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/chemin_biblio_600.png',
              width: 300, height: 120, fit: BoxFit.cover),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _addFormKey,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Consumer<LibraryModel>(
                      builder: (context, library, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          onSaved: (value) {
                            title = value as String;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Entrez le titre du livre'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez indiquer le titre du livre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onSaved: (value) {
                            author = value as String;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Entrez l\'auteur du livre'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _dateInput,
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_addFormKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                _addFormKey.currentState?.save();

                                library.add(Book(
                                    '', title, author, _selectedDate, false));

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Enregistré !')),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Ajouter')),
                      ],
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900, 01, 01),
        lastDate: DateTime.now());
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _dateInput
        ..text = DateFormat.yMMM().format(newSelectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateInput.text.length, affinity: TextAffinity.upstream));
    }
  }
}
