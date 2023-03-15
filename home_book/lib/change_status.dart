import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Book.dart';
import 'admin_main_page.dart';

class ChangeStatus extends StatefulWidget {
  const ChangeStatus({Key? key}) : super(key: key);

  @override
  State<ChangeStatus> createState() => _ChangeStatusState();
}

class _ChangeStatusState extends State<ChangeStatus> {
  void initState() {
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
        title: Text('Change A Book\'s Status'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusChangePlace(
                            books[index].book_id,
                            books[index].book_genre,
                            books[index].book_title,
                            books[index].book_status,
                            books[index].ISBN,
                            books[index].publisher_id,
                            books[index].author_id),
                      ),
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

class StatusChangePlace extends StatefulWidget {
  String book_id;
  String book_genre;
  String book_title;
  String book_status;
  String ISBN;
  int publisher_id;
  int author_id;

  StatusChangePlace(this.book_id, this.book_genre, this.book_title,
      this.book_status, this.ISBN, this.publisher_id, this.author_id,
      {Key? key})
      : super(key: key);

  @override
  State<StatusChangePlace> createState() => _StatusChangePlaceState();
}

class _StatusChangePlaceState extends State<StatusChangePlace> {
  Future giveBook() async {
    print('${widget.book_id} asdasd');
    final response = await http
        .post(Uri.parse("http://10.0.2.2/login/changestatus.php"), body: {
      "book_id": widget.book_id as String,
      "book_status": widget.book_status,
    });
    //var dataBook = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeStatus(),
                  ),
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
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.book_status = "given";
                            });
                            giveBook();
//                          Navigator.pop(context);
                          },
                          child: Text('Give book to the student!'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.book_status = "exist";
                            });
                            giveBook();
//                          Navigator.pop(context);
                          },
                          child: Text('Student gave the book!'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.book_status = "reserve";
                            });
                            giveBook();
//                          Navigator.pop(context);
                          },
                          child: Text('A student reserved the book!'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
