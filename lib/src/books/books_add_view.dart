import 'package:flutter/material.dart';
import 'package:ma_biblio/src/books/books_controller.dart';
import 'package:ma_biblio/src/books/books_service.dart';

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
  bool read = false;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text =
        DateTime.now().year.toString(); //set the initial value of text field
    super.initState();
  }

  void saveBook() {
    controller.saveLibrary(title, author, year, read);
  }

  // Future _selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2016),
  //       lastDate: DateTime(2026));
  //   if (picked != null) setState(() => dateInput.text = picked.year.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un livre')),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset('assets/images/chemin_biblio_600.png',
              width: 600, height: 240, fit: BoxFit.cover),
          Expanded(
            child: Form(
              key: _addFormKey,
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
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
                    TextFormField(
                      onSaved: (value) {
                        author = value as String;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Entrez l\'auteur du livre'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_addFormKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            _addFormKey.currentState?.save();
                            saveBook();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Enregistré !')),
                            );
                            Navigator.pushNamed(context, '/');
                          }
                        },
                        child: const Text('Ajouter')),
                  ],
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
