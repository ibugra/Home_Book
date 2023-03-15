import 'package:flutter/material.dart';
import 'package:library_system/ui/size_config.dart';

import 'components/body.dart';

class SignInScreenAdmin extends StatefulWidget {
  static String routeName = "/sign_in";

  @override
  State<SignInScreenAdmin> createState() => _SignInScreenAdminState();
}

class _SignInScreenAdminState extends State<SignInScreenAdmin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
