import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/services/firebase_auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    final FocusNode _emailFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (input) {
                _email = input;
              },
              focusNode: _emailFocus,
              onFieldSubmitted: (String val) {
             //   _emailFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: TextFormField(
                onChanged: (input) {
                  _password = input;
                },
                focusNode: _passwordFocus,
                onFieldSubmitted: (value) {
                  _passwordFocus.unfocus();
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                signIn(_email, _password);
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
      FirebaseAuthService _auth = new FirebaseAuthService();
      var result=await _auth.signInWithEmailAndPassword(email.trim(), password.trim());
      print(result);
  }

}
