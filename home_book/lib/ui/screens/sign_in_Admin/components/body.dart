
import 'package:flutter/material.dart';
import 'package:library_system/ui/constants.dart';
import 'package:library_system/ui/screens/sign_in/sign_in_screen.dart';
import 'package:library_system/ui/screens/sign_in_Admin/sign_in_screen.dart';
import '../../../components/no_account_text.dart';
import '../../../components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "HomeBook 📚",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Sign in as a Librarian ",style: TextStyle(color: kPrimaryColor),
                  textAlign: TextAlign.center,
                  //
                ),
                SizedBox(height: 12,),
                Text("🕵️‍♂",style: TextStyle(fontSize: 35),),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign in as a Student ",
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen())),
                  child: Text(
                    "Student Page",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: getProportionateScreenWidth(16),
                        color: kPrimaryColor),
                  ),
                ),
              ],
            )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
