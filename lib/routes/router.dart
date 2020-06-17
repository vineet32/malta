import 'package:flutter/material.dart';
import 'package:malta/app/authentiation_pages/sign_in.dart';
import 'package:malta/app/authentiation_pages/sign_up.dart';

class Router {
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      case signIn:
        return MaterialPageRoute(builder: (context) => SignIn());
      case signUp:
        return MaterialPageRoute(builder: (context) => SignUp());

    }
  }
}