class Author {
  String author_id;
  String author_name;

  Author({
    required this.author_id,
    required this.author_name,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        author_id: json['author_id'],
        author_name: json['author_name']);
  }
}
