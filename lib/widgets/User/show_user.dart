import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/connection.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class ShowUser extends StatelessWidget {
  final String userName;
  final String roleType;
  ShowUser({this.userName,this.roleType});
  @override
  Widget build(BuildContext context) {
   ConnectionContract api = Provider.of<ConnectionContract>(context);
    School school=Provider.of<SchoolProvider>(context).getCurrentlySelectedSchool;
      return FutureBuilder<ApiResponse>(
          future: api.getUserByUserName(userName),
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
                              ..set(Connection.keyRole, roleType)
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
