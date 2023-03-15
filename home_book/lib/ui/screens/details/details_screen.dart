import 'package:flutter/material.dart';
import 'package:library_system/Book.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  Book book;
String title;
  DetailsScreen({Key? key,required this.book, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: book.book_genre.toString()),
      ),
      body: Body(book: book,title:title),
    );
  }
}

