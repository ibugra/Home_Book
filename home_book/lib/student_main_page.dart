import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_system/authors.dart';
import 'package:library_system/change_status.dart';
import 'package:library_system/findbook.dart';
import 'package:library_system/updatebook_page.dart';
import 'package:library_system/wishlist.dart';

import 'addbook_page.dart';

class StudentMainPage extends StatefulWidget {
  var datause;

  StudentMainPage(this.datause, {Key? key}) : super(key: key);

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/0b/15/fb/0b15fb145a8e9dc03468836f37968a84.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.2)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1).withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.menu_book_sharp,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to System',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        'Management',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30),
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Choose your Topic',
                      style: TextStyle(),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13.5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 17,
                                  spreadRadius: -23,
                                  color: Colors.red,
                                )
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print(widget.datause[0]['username']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FindBook(widget.datause),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Spacer(),
                                  Image.network(
                                      'https://www.oecd-nea.org/upload/docs/image/jpeg/2020-11/book_stack.jpg',
                                      height: 80),
                                  Spacer(),
                                  Text(
                                    'ALL BOOKS',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // MenuCard(
                        //     title: 'Update Books',
                        //     imagePath:
                        //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCjKLg5bpIQa_yCH3wCU_G90nPInE8W57-Ww&usqp=CAU'),

                        // Container(
                        //   padding: EdgeInsets.all(20),
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(13.5),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           offset: Offset(0, 17),
                        //           blurRadius: 17,
                        //           spreadRadius: -23,
                        //           color: Colors.red,
                        //         )
                        //       ]),
                        //   child: Material(
                        //     color: Colors.transparent,
                        //     child: InkWell(
                        //       onTap: () {
                        //
                        //
                        //       },
                        //       child: Column(
                        //         children: [
                        //           Spacer(),
                        //           Image.network(
                        //               'https://meaning-dictionary.com/wp-content/uploads/2021/06/11.jpg',
                        //               height: 80),
                        //           Spacer(),
                        //           Text(
                        //             'Change Status',
                        //             style:
                        //             TextStyle(fontWeight: FontWeight.w400),
                        //             textAlign: TextAlign.center,
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        //
                        // MenuCard(
                        //     title: 'Change Status',
                        //     imagePath:
                        //         'https://meaning-dictionary.com/wp-content/uploads/2021/06/11.jpg'),

                        // MenuCard(
                        //   title: 'Add/Remove a Book',
                        //   imagePath:
                        //       'https://www.shareicon.net/data/256x256/2016/06/27/623443_book_256x256.png',
                        // ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13.5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 17,
                                  spreadRadius: -23,
                                  color: Colors.red,
                                )
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Wishlist(widget.datause),
                                    ),
                                    (route) => false);
                              },
                              child: Column(
                                children: [
                                  Spacer(),
                                  Image.network(
                                      'https://thumbs.dreamstime.com/b/wishlist-hand-drawn-vector-lettering-isolated-white-background-motivation-phrase-design-poster-greeting-card-photo-album-145269082.jpg',
                                      height: 80),
                                  Spacer(),
                                  Text(
                                    'Wishlist',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // MenuCard(
                        //   title: 'Edit Other Things',
                        //   imagePath:
                        //   'https://i1.sndcdn.com/avatars-000756983419-d4lyj9-t500x500.jpg',
                        // )

                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13.5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 17,
                                  spreadRadius: -23,
                                  color: Colors.red,
                                )
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AuthorsName('3'))); //You can change the author_id here
                              },
                              child: Column(
                                children: [
                                  Spacer(),
                                  Image.network(
                                      'https://assets.aboutamazon.com/dims4/default/71b222e/2147483647/strip/true/crop/2000x1074+0+130/resize/1440x773!/quality/90/?url=https%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2F56%2F01%2F834aa61747c19ef723f0b48ec134%2F20180517nealthompsonauthor-js-11.jpg',
                                      height: 80),
                                  Spacer(),
                                  Text(
                                    'Authors',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const MenuCard({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.red,
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Spacer(),
              Image.network(imagePath, height: 80),
              Spacer(),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
