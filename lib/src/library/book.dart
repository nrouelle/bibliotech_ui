class Book {
  Book(this.title, this.author, this.readDate, this.read);

  final String title;
  final String author;
  final DateTime readDate;
  final bool read;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['title'] as String, json['author'] as String,
        DateTime.parse(json['readDate']), json['read'] as bool);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'readDate': readDate.toIso8601String(),
        'read': true
      };
}
