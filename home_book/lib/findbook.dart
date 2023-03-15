import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_system/reservebook_page.dart';

import 'Book.dart';

class FindBook extends StatefulWidget {
  var datause;

  FindBook(this.datause, {Key? key}) : super(key: key);

  @override
  State<FindBook> createState() => _FindBookState();
}

class _FindBookState extends State<FindBook> {
  String formattedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  late int bookid;

  void initState() {
    // print('Init is started here');
    // setState(() {});
    generateBookList();
  }

  late List<Book> books = [];

  Future<dynamic> generateBookList() async {
    print('asa');
    final response =
        await http.get(Uri.parse('http://10.0.2.2/login/book.php'));
    var list = json.decode(response.body);
    List<Book> book =
        await list.map<Book>((json) => Book.fromJson(json)).toList();
    print(book[0].book_id);
    setState(() {
      books = book;
    });
    return book;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('All Books!'),
      ),
      body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            books[index].book_id,
                            books[index].book_genre,
                            books[index].book_title,
                            books[index].book_status,
                            books[index].ISBN,
                            books[index].publisher_id,
                            books[index].author_id,
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
                      Text('${books[index].book_genre} '),
                      Text('${books[index].book_title} '),
                      Row(
                        children: [
                          Text('${books[index].book_status} '),
                          Text('${books[index].ISBN} '),
                          Text('${books[index].publisher_id} '),
                          Text('${books[index].author_id} '),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
