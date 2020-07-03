import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/admin_tab/show_user_widget.dart';
import 'package:provider/provider.dart';

class ShowUserList extends StatelessWidget {
  final String role;

  const ShowUserList(this.role, {Key key})
      : assert(role != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final _connectionApi = Provider.of<ConnectionContract>(context);
    final _school = Provider.of<SchoolProvider>(context);

    return FutureBuilder<ApiResponse>(
        future: _connectionApi.getAllUsers(
            _school.getCurrentlySelectedSchool, role),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.results != null) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: snapshot.data.results.map<Widget>((connection) {
                      return ShowUserWidget(
                        user: connection.user,
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              return Center(child: Text("$role 's are Empty "));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
