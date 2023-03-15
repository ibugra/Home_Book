import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_system/findbook.dart';
import 'package:library_system/student_main_page.dart';

class ReserveBookPage extends StatefulWidget {
  String book_id;
  String book_genre;
  String book_title;
  String book_status;
  String ISBN;
  int publisher_id;
  int author_id;
  var datause;

  ReserveBookPage(
      this.book_id,
      this.book_genre,
      this.book_title,
      this.book_status,
      this.ISBN,
      this.publisher_id,
      this.author_id,
      this.datause,
      {Key? key})
      : super(key: key);

  @override
  State<ReserveBookPage> createState() => _ReserveBookPageState();
}

class _ReserveBookPageState extends State<ReserveBookPage> {
  String formattedDate =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();

  Future reserveBook() async {
    print(widget.datause[0]['id']);
    print(widget.book_id);
    print(formattedDate);
    final response = await http
        .post(Uri.parse("http://10.0.2.2/login/reservebook.php"), body: {
      "book_id": widget.book_id,
      "student_id": widget.datause[0]['id'],
      "date": formattedDate,
      "book_status": 'reserve',
    });
    //var dataBook = json.decode(response.body);
  }

  Future addWishlist() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/login/addwishlist.php"), body: {
      "book_id": widget.book_id,
      "student_id": widget.datause[0]['id'],
    });
    //var dataBook = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentMainPage(widget.datause)),
                (route) => false);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Material(
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ID: ${widget.book_id}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          title: Column(
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Genre: ${widget.book_genre} '),
                      Text('Title: ${widget.book_title} '),
                      Text('ISBN: ${widget.ISBN}'),
                      Text('Publisher ID: ${widget.publisher_id}'),
                      Text('Author ID: ${widget.author_id}'),
                      Text('${widget.book_status}'),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            //      if (widget.book_status != 'reserve' && widget.book_status != 'given') {
                            if (widget.book_status == 'exist') {
                              reserveBook();
                              setState(() {
                                widget.book_status = "reserve";
                              });
//                          Navigator.pop(context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                      'The book has been reserved before!\n\nYou cannot reserve this book now!',
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Text('Reserve the Book!'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Text('ADD WISHLIST '),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () async {
                                await addWishlist();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        'The book has been added to your Wishlist!!',
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.add),
                            ),
                            maxRadius: 19,
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
