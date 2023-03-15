import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("HomeBook📚",style: TextStyle(fontSize: 32)),
          Row(children: [
            IconBtnWithCounter(
              svgSrc: "assets/icons/Gift Icon.svg",
              //numOfitem: 3,
              press: () {},
            ),],)
        ],
      ),
    );
  }
}
// [{"book_id":"1","publisher_id":"5","author_id":"2","book_title":"Deneme Book","book_status":"exist","book_genre":"Science","ISBN":"9875465435"},
// {"book_id":"2","publisher_id":"2","author_id":"3","book_title":"Don Quijote","book_status":"exist","book_genre":"Novel","ISBN":"9788497403573"},
// {"book_id":"3","publisher_id":"1","author_id":"2","book_title":"Sherlock Holmes","book_status":"exist","book_genre":"whodunit","ISBN":"14568"},
// {"book_id":"4","publisher_id":"3","author_id":"1","book_title":"Merlin","book_status":"reserve","book_genre":"Novel","ISBN":"9786055034009"},
// {"book_id":"5","publisher_id":"4","author_id":"2","book_title":"Discrete Mathematics and Its Applications","book_status":"exist","book_genre":"Science","ISBN":"9780857501004"},
// {"book_id":"6","publisher_id":"5","author_id":"3","book_title":"A Brief History Of Time","book_status":"exist","book_genre":"Science","ISBN":"785162326"},
// {"book_id":"7","publisher_id":"3","author_id":"2","book_title":"Sefiller","book_status":"exist","book_genre":"novel","ISBN":"4879435135"}]
