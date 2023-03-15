import 'package:flutter/material.dart';
import 'package:library_system/Book.dart';
import 'package:library_system/ui/screens/cart/cart_screen.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  List<Book> books;
   DiscountBanner({
    Key? key,required this.books
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){('asdasdasd');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(books: books,title: "All Books",)));
      },
      child: Container(
        // height: 90,
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text.rich(
          TextSpan(
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(text: "List\n"),
              TextSpan(
                text: "All Books",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
