import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/widgets/User/show_user.dart';


class AddConnection extends StatefulWidget{
  final String roleType;
  AddConnection({this.roleType});
  @override
  _AddConnectionState createState() => _AddConnectionState();
}

class _AddConnectionState extends State<AddConnection> {
  String _userName;
  bool foundUser = false;
  ConnectionContract api;
  School school;
  final FocusNode _searchFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('SEARCH',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 3.0),),
          TextFormField(
            onChanged: (input) {
              _userName = input;
            },
            focusNode: _searchFocus,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  _searchFocus.unfocus();
                  foundUser = true;
                  setState(() {});
                },
                icon: Icon(Icons.search),
              ),
              labelText: 'Search',
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
          foundUser ? Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ShowUser(userName: _userName,roleType: widget.roleType,),
          ) : Text(''),
        ],
      ),
    );
  }

}