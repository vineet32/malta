
import 'package:flutter/material.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/User/user_details_card.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;
  final String role;
  UserDetailsPage({this.user,this.role});
  @override
  Widget build(BuildContext context) {
    School school=Provider.of<SchoolProvider>(context).getCurrentlySelectedSchool;
    ConnectionContract api=Provider.of<ConnectionContract>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              size: 30,
              color: Colors.red,
            ),
            onPressed: (){
              api.delete(user, role,school);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
          child: Center(
              child: UserDetailsCard(
        user: user,
      ))),
    );
  }
}
