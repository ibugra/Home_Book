import 'package:flutter/material.dart';

import '../../../../Book.dart';
import '../../../components/default_button.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  final Book book;
  final String title;

  const Body({Key? key, required this.book, required this.title})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future giveBook() async {
    print('${widget.book.book_id} asdasd');
    final response = await http
        .post(Uri.parse("http://10.0.2.2/login/changestatus.php"), body: {
      "book_id": widget.book.book_id as String,
      "book_status": widget.book.book_status,
    });
    //var dataBook = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          "assets/images/${widget.book.book_genre.toString().toLowerCase()}.png",
          width: 275,
          height: 275,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(20)),
          child: Text(
            widget.book.book_title,
            style: TextStyle(
                fontSize: 31, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Genre: ${widget.book.book_genre}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Author ID: ${widget.book.author_id}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Publisher ID: ${widget.book.publisher_id}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "ISBN: ${widget.book.ISBN}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Status: ${widget.book.book_status}",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Column(
          children: [
            TopRoundedContainer(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * 0.15,
                  right: SizeConfig.screenWidth * 0.15,
                ),
                child: widget.title == "Change Status"
                    ? Column(
                        children: [
                          DefaultButton(
                            text: "Give book to the Student",
                            press: () {
                              setState(() {
                                widget.book.book_status = "given";
                              });
                              giveBook();
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DefaultButton(
                                  text: "Is Given",
                                  press: () {
                                    setState(() {
                                      widget.book.book_status = "exist";
                                    });
                                    giveBook();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: DefaultButton(
                                  text: "Is Reserved",
                                  press: () {setState(() {
                                    widget.book.book_status = "reserve";
                                  });
                                  giveBook();},
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: DefaultButton(
                                  text: "WishList",
                                  press: () {},
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: DefaultButton(
                                  text: "Reservation",
                                  press: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
