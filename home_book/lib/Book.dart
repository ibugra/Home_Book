class Book {
  String book_id;
  int publisher_id;
  int author_id;
  String book_title;
  String book_status;
  String book_genre;
  String ISBN;

  Book(
      {required this.book_id,
      required this.publisher_id,
      required this.author_id,
      required this.book_title,
      required this.book_status,
      required this.ISBN,
      required this.book_genre});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        //book_id: int.parse(json['book_id']),
        book_id: json['book_id'],
        author_id: int.parse(json['author_id']),
        book_genre: json['book_genre'] as String,
        publisher_id: int.parse(json['publisher_id']),
        book_status: json['book_status'] as String,
        book_title: json['book_title'] as String,
        ISBN: json['ISBN']);
  }
}
