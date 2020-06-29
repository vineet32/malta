import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'display_school.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String _email, _password,_errorMessage;
  bool _error=false;
  @override
  Widget build(BuildContext context) {
    final FocusNode _emailFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();
    final UserContract userContract=Provider.of<UserContract>(context);
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
            _error==true?Text(_errorMessage,style: TextStyle(color: Colors.red),):Text(''),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: ()async {
                User user=User(_email,_password,_email);
                ApiResponse response =await userContract.login(user);
                if(response.success){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Provider<User> (create: (_)=>user,child: DisplaySchool(),)),
                  );
                }
                else{

                  setState(() {
                    _errorMessage=response.error.message;
                    _error=true;
                  });
                }
              },
              child: Text('LogIn'),
            ),
          ],
        ),
      ),
    );
  }
}