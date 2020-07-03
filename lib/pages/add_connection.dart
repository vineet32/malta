import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

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
    api = Provider.of<ConnectionContract>(context);
    school=Provider.of<SchoolProvider>(context).getCurrentlySelectedSchool;
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
            child: _showUser(),
          ) : Text(''),
        ],
      ),
    );
  }

  Widget _showUser() {
    return FutureBuilder<ApiResponse>(
        future: api.getUserByUserName(_userName),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.results != null) {
              String name=snapshot.data.results[0]['username'];
              var userObject=snapshot.data.results[0];
              ParseFile file=snapshot.data.results[0]['image'];
              return Card(
                elevation: 0.0,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(file.url),
                        backgroundColor: Colors.red,
                        radius: 45,
                      ),
                    ),
                    Text(name),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: (){
                          api.add(Connection()..set(Connection.keySchool, school)
                            ..set(Connection.keyRole, widget.roleType)
                            ..set(Connection.keyUser, userObject));
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text('No User Found',style: TextStyle(fontSize: 20,color: Colors.red),);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                value: .5,
              ),
            );
          }
        });
  }
}