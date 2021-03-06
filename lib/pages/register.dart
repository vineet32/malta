import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/display_school.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FocusScopeNode _node = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName, _email, _password, _errorMessage;
  bool _error = false;
  bool _loading = false;
  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.grey),
    );
    final focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.red),
    );
    final enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.grey),
    );
    final errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide(color: Colors.red));
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
                              focusedBorder: focusedBorder,
                              enabledBorder: enabledBorder,
                              errorBorder: errorBorder,
                              focusedErrorBorder: focusedErrorBorder,
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
                              focusedBorder: focusedBorder,
                              enabledBorder: enabledBorder,
                              errorBorder: errorBorder,
                              focusedErrorBorder: focusedErrorBorder,
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
                              focusedBorder: focusedBorder,
                              enabledBorder: enabledBorder,
                              errorBorder: errorBorder,
                              focusedErrorBorder: focusedErrorBorder,
                            ),
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            // move to the next field
                            onEditingComplete: _node.nextFocus,
                          ),
                        ),
                        _error == true
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _errorMessage,
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : Container(),
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
        final User user =
            await ParseUser.currentUser(customUserObject: User.clone());
        UserProvider provider =
            Provider.of<UserProvider>(context, listen: false);
        provider.setCurrentUser(user);
        Navigator.of(context).popUntil((route) => route.isFirst);

        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DisplaySchool()),
        );
      } else {
        setState(() {
          _errorMessage = response.error.message;
          _error = true;
        });
      }
    }
  }
}
