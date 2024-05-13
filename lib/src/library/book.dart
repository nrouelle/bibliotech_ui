class Book {
  Book(this.uid, this.title, this.author, this.readDate, this.read);

  String uid;
  final String title;
  final String author;
  final DateTime? readDate;
  final bool read;

  factory Book.fromJson(Map<String, dynamic> json) {
    String uid = json['uid'] as String; // const Uuid().v4(); //
    String title = json['title'] as String;
    String author = json['author'] as String;
    DateTime? readDate = DateTime.tryParse(json['readDate'].toString());
    var read = json['read'] as bool;
    return Book(uid, title, author, readDate, read);
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'author': author,
        'readDate': readDate?.toIso8601String(),
        'read': true
      };
}
