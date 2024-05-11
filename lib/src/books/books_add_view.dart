import 'package:flutter/material.dart';
import 'package:ma_biblio/src/library/book.dart';
import 'package:ma_biblio/src/library/library_controller.dart';
import 'package:ma_biblio/src/library/library_service.dart';
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
  String year = '';
  bool read = false;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un livre')),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Image.asset('assets/images/chemin_biblio_600.png',
              width: 600, height: 240, fit: BoxFit.cover),
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
                        const SizedBox(height: 10),
                        TextFormField(
                          onSaved: (value) {
                            author = value as String;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Entrez l\'auteur du livre'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_addFormKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                _addFormKey.currentState?.save();

                                library.add(Book(title, author, null, false));

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

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _addFormKey,
//       child: Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Center(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   onSaved: (value) {
//                     title = value as String;
//                   },
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Entrez le titre du livre'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Veuillez indiquer le titre du livre';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   onSaved: (value) {
//                     author = value as String;
//                   },
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Entrez l\'auteur du livre'),
//                 ),
//                 TextFormField(
//                   controller: dateInput,
//                   readOnly: true,
//                   onSaved: (value) {
//                     year = value as String;
//                   },
//                   onTap: () {
//                     FocusScope.of(context).requestFocus(FocusNode());
//                     _selectDate();
//                   },
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: 'Année de lecture'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Text('Livre déjà lu ? '),
//                     Switch(
//                         value: read,
//                         onChanged: (bool value) {
//                           setState(() {
//                             read = value;
//                           });
//                         }),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (_addFormKey.currentState!.validate()) {
//                               // If the form is valid, display a snackbar. In the real world,
//                               // you'd often call a server or save the information in a database.
//                               _addFormKey.currentState?.save();
//                               saveBook();
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content: Text('Processing Data')),
//                               );
//                               Navigator.pushNamed(context, '/');
//                             }
//                           },
//                           child: const Text('Ajouter')),
//                       ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text('Annuler')),
//                     ],
//                   ),
//                 ),
//               ],
//             ))),
//       ),
//     );
//   }
}
