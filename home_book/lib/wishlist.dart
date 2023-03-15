import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_system/reservebook_page.dart';
import 'package:library_system/student_main_page.dart';
import 'package:library_system/wishlistBookId.dart';

import 'Book.dart';
import 'admin_main_page.dart';

class Wishlist extends StatefulWidget {
  var datause;

  Wishlist(this.datause, {Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  late List<WishlistBookId> wbId = [];

  void initState() {
    // print('Init is started here');
    // setState(() {});
    generateWishlistIds();
  }

  late List<Book> bookss = [];

  Future<dynamic> generateWishlistIds() async {
    print('asda');
    final response = await http
        .post(Uri.parse('http://10.0.2.2/login/findwishlist.php'), body: {
      "student_id": widget.datause[0]['id'],
    });
    var list = json.decode(response.body);
    List<Book> book =
        await list.map<Book>((json) => Book.fromJson(json)).toList();
    print(book[0].book_id);
    setState(() {
      bookss = book;
    });
    return book;
  }

  //datause[0]['id']
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentMainPage(widget.datause)));
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: ListView.builder(
        itemCount: bookss.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(3, 4))
                ],
              ),
              child: ListTile(
                onTap: () {
                  // print(books[index].book_id);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReserveBookPage(
                          bookss[index].book_id,
                          bookss[index].book_genre,
                          bookss[index].book_title,
                          bookss[index].book_status,
                          bookss[index].ISBN,
                          bookss[index].publisher_id,
                          bookss[index].author_id,
                          widget.datause),
                    ),
                    (route) => false,
                  );
                },
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${bookss[index].book_genre} '),
                    Text('${bookss[index].book_title} '),
                    Row(
                      children: [
                        Text('${bookss[index].book_status} '),
                        Text('${bookss[index].ISBN} '),
                        Text('${bookss[index].publisher_id} '),
                        Text('${bookss[index].author_id} '),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
