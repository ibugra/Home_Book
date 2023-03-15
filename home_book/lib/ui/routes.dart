import 'package:flutter/widgets.dart';
import 'package:library_system/ui/screens/cart/cart_screen.dart';
import 'package:library_system/ui/screens/details/details_screen.dart';
import 'package:library_system/ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:library_system/ui/screens/home/home_screen.dart';
import 'package:library_system/ui/screens/login_success/login_success_screen.dart';
import 'package:library_system/ui/screens/otp/otp_screen.dart';
import 'package:library_system/ui/screens/profile/profile_screen.dart';
<<<<<<< HEAD
=======
import 'package:library_system/ui/screens/sign_in/components/sign_form.dart';
>>>>>>> origin/master
import 'package:library_system/ui/screens/sign_in/sign_in_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
<<<<<<< HEAD
  HomeScreen.routeName: (context) => HomeScreen(),
=======
  HomeScreen.routeName: (context) => HomeScreen(SignForm.datause),
>>>>>>> origin/master
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
