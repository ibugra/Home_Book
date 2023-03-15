import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_system/ui/constants.dart';

import 'admin_main_page.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  Future senddata() async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2/login/addbook.php"), body: {
      "publisher_id": publisher_id.text,
      "author_id": author_id.text,
      "book_title": book_title.text,
      "book_status": book_status.text,
      "book_genre": book_genre.text,
      "ISBN": ISBN.text,
    });
    //var dataBook = json.decode(response.body);
  }

  TextEditingController publisher_id = TextEditingController();
  TextEditingController author_id = TextEditingController();
  TextEditingController book_title = TextEditingController();
  TextEditingController book_status = TextEditingController();
  TextEditingController book_genre = TextEditingController();
  TextEditingController ISBN = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add A Book',style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminMainPage(),
                  ),
                      (route) => false);
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Publisher ID',
                ),
                controller: publisher_id,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Author ID',
                ),
                controller: author_id,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Book Title',
                ),
                controller: book_title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Book Status',
                ),
                controller: book_status,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Book Genre',
                ),
                controller: book_genre,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ISBN',
                ),
                controller: ISBN,
              ),
            ),
            Expanded(child: Text("")),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:  MaterialStateProperty.all(kPrimaryColor),),
              child: Text('Add Book'),
              onPressed: () {
                senddata();
              },
            ),
          ],
        ),
      ),
    );
  }
}
