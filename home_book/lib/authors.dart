import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Author.dart';
import 'Book.dart';

class AuthorsName extends StatefulWidget {
  var authorId;

  AuthorsName(this.authorId, {Key? key}) : super(key: key);

  @override
  State<AuthorsName> createState() => _AuthorsNameState();
}

class _AuthorsNameState extends State<AuthorsName> {
  void initState() {
    generateAuthors();
  }


  late List<Author> authors = [];

  Future<dynamic> generateAuthors() async {

print(widget.authorId);
    final response =
        await http.post(Uri.parse('http://10.0.2.2/login/authors.php'), body: {
      "author_id": widget.authorId[0],
    });
    var list = json.decode(response.body);
    List<Author> author =
        await list.map<Author>((json) => Author.fromJson(json)).toList();
    print(author[0].author_id);
    setState(() {
      authors = author;
    });
    return author;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: authors.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              leading: Text('${authors[index].author_id}'),
              title: Text(authors[index].author_name),
            ),
          );
        },
      ),
    );
  }
}
