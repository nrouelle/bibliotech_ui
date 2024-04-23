class Book {
  Book(this.title, this.author, this.year, this.read);

  final String title;
  final String author;
  final String year;
  final bool read;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(json['title'] as String, json['author'] as String,
        json['year'] as String, true);
  }
}
