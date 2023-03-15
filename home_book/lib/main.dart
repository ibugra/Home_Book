<<<<<<< HEAD
//genres: article, dictionary, history, novel, science

import 'package:flutter/material.dart';
import 'package:library_system/ui/screens/sign_in/sign_in_screen.dart';
import 'package:library_system/ui/size_config.dart';
import 'package:library_system/ui/theme.dart';

import 'login_page_student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home:SignInScreen()
      //LoginPageStudent(),
    );
  }
}

=======
//genres: article, dictionary, history, novel, science

import 'package:flutter/material.dart';
import 'package:library_system/ui/screens/sign_in/sign_in_screen.dart';
import 'package:library_system/ui/size_config.dart';
import 'package:library_system/ui/theme.dart';

import 'login_page_student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home:SignInScreen()
      //LoginPageStudent(),
    );
  }
}
