class WishlistBookId {
  String book_id;

  WishlistBookId({required this.book_id});

  factory WishlistBookId.fromJson(Map<String, dynamic> json) {
    return WishlistBookId(
//book_id: int.parse(json['book_id']),
        book_id: json['book_id']);
  }
}
