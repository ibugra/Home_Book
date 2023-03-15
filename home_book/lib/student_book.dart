import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_system/Book.dart';

class StudentBook extends StatefulWidget {
  const StudentBook({Key? key}) : super(key: key);

  @override
  State<StudentBook> createState() => _StudentBookState();
}

class _StudentBookState extends State<StudentBook> {
  void initState() {
    setState(() {});
    // print('Init is started here');
    generateBookList();
  }

  late List<Book> books = [];

  Future<dynamic> generateBookList() async {
    print('asa');
    // Give your sever URL of get_employees_details.php file
    var url = Uri.parse('http://10.0.2.2/login/book.php');
    final response =
        await http.get(Uri.parse('http://10.0.2.2/login/book.php'));
    var list = json.decode(response.body);
    List<Book> book =
        await list.map<Book>((json) => Book.fromJson(json)).toList();
    print(book);
    setState(() {
      books = book;
    });
    return book;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: ListView.builder(
          itemCount: books.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '${books[index].book_id} ',
                            ),
                            Text('${books[index].book_genre} '),
                            Text('${books[index].book_title} '),
                          ],
                        ),
                        Row(
                          children: [
                            Text('${books[index].book_status} '),
                            Text('${books[index].ISBN} '),
                            Text('${books[index].publisher_id} '),
                            Text('${books[index].author_id} '),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
