import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Book.dart';
import '../../../models/Cart.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  List<Book> books;
  String title;
   Body({Key? key,required this.books, required this.title}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: widget.books.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(widget.books[index].book_id.toString()),
            direction: DismissDirection.endToStart,

            child: CartCard(cart: widget.books[index],title:widget.title),
          ),
        ),
      ),
    );
  }
}
