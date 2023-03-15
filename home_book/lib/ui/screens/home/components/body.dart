import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../Book.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    // print('Init is started here');
    // setState(() {});
    books.add(Book(book_id: "1", publisher_id: 3, author_id: 2, book_title: "book_title", book_status: "exist", ISBN: "ISBN", book_genre: "Science"));
    books.add(Book(book_id: "2", publisher_id: 3, author_id: 2, book_title: "book_title", book_status: "exist", ISBN: "ISBN", book_genre: "Science"));
    books.add(Book(book_id: "3", publisher_id: 4, author_id: 5, book_title: "book_title2", book_status: "reserved", ISBN: "ISBN2", book_genre: "History"));
    books.add(Book(book_id: "4", publisher_id: 4, author_id: 5, book_title: "book_title3", book_status: "reserved", ISBN: "ISBN2", book_genre: "Article"));
    books.add(Book(book_id: "5", publisher_id: 4, author_id: 5, book_title: "book_title4", book_status: "exist", ISBN: "ISBN2", book_genre: "Dict"));
    books.add(Book(book_id: "6", publisher_id: 4, author_id: 5, book_title: "book_title5", book_status: "reserved", ISBN: "ISBN2", book_genre: "Article"));
    books.add(Book(book_id: "7", publisher_id: 4, author_id: 5, book_title: "book_title6", book_status: "reserved", ISBN: "ISBN2", book_genre: "Novel"));
    books.add(Book(book_id: "8", publisher_id: 4, author_id: 5, book_title: "book_title7", book_status: "exist", ISBN: "ISBN2", book_genre: "Article"));
    books.add(Book(book_id: "9", publisher_id: 4, author_id: 5, book_title: "book_title8", book_status: "exist", ISBN: "ISBN2", book_genre: "Science"));
    books.add(Book(book_id: "10", publisher_id: 4, author_id: 5, book_title: "book_title9", book_status: "reserved", ISBN: "ISBN2", book_genre: "Science"));


  }


  late List<Book> books = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(books: books,),
            Categories(books: books,),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(books:books),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
