import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../Book.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  List<Book> books;
   PopularProducts({Key? key,required this.books}) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  List<String> strList=[];
  Future<void> filterList(String genre)async {

    for(int i=0; i<=widget.books.length/2;i++){
      strList.add(Random().nextInt(widget.books.length-1).toString());
    }
    Iterable<Book> books2=await widget.books.where((element) => strList.contains(element.book_id));
    widget.books = books2.toList();
    widget.books.shuffle();
  }
  @override
  void initState() {
    // TODO: implement initState
    filterList("genre").then((value) => setState(() {

    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Recommended Books", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                widget.books.length,
                (index) {
                    return ProductCard(product: widget.books[index]);
return Text(widget.books[index].book_title);
                  // return SizedBox
                  //     .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
