import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/display_school.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName;
  String _email;
  String _password;
  bool _loading = false;
  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: FocusScope(
                    node: _node,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'User name can\'t be Empty';
                              }
                              return null;
                            },
                            onChanged: (input) {
                              _userName = input;
                            },
                            decoration: InputDecoration(
                              labelText: 'User name',
                              hintText: 'User name',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5),
                              prefixIcon: Icon(Icons.person),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: _node.nextFocus,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Email can\'t be Empty';
                              }
                              return null;
                            },
                            onChanged: (input) {
                              _email = input;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Email',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5),
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            // move to the next field
                            onEditingComplete: _node.nextFocus,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return 'Password can\'t be Empty';
                              }
                              return null;
                            },
                            onChanged: (input) {
                              _password = input;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: "Password",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5),
                              prefixIcon: Icon(Icons.lock),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                            ),
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            // move to the next field
                            onEditingComplete: _node.nextFocus,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Already have account? ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                    text: 'login',
                                    style: TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pop();
                                      }),
                              ],
                            ),
                          ),
                        ),
                        RaisedButton(
                          child: Text('Sign up'),
                          onPressed: () async {
                            await signUp();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Future signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      final userContract = Provider.of<UserContract>(context, listen: false);
      User user = User(_userName, _password, _email);
      ApiResponse response = await userContract.signUp(user);
      setState(() {
        _loading = false;
      });
      if (response.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Provider<User>(
              create: (_) => user,
              child: DisplaySchool(),
            ),
          ),
        );
      }
    }
    print("sign up");
  }
}
