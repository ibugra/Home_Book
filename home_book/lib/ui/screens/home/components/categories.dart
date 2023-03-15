import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_system/Book.dart';
import 'package:library_system/ui/screens/cart/cart_screen.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  List<Book> books;
   Categories({Key? key,required this.books}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/article.png", "text": "Article"},
      {"icon": "assets/images/dict.png", "text": "Dict"},
      {"icon": "assets/images/history.png", "text": "History"},
      {"icon": "assets/images/novel.png", "text": "Novel"},
      {"icon": "assets/images/science.png", "text": "Science"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            books: books,
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  List<Book> books;
  CategoryCard({
    Key? key,
    required this.books,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon;
  final String? text;
  final GestureTapCallback press;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  Future<void> filterList(String genre)async {
    Iterable<Book> books2=await widget.books.where((element) => element.book_genre==genre);
    widget.books = books2.toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                filterList(widget.text.toString()).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(title: widget.text.toString() + " Books", books: widget.books,))));

              },
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(widget.icon!),
              ),
            ),
            SizedBox(height: 5),
            Text(widget.text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
