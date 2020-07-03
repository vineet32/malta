import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/pages/home_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/school/add_school.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatelessWidget {
  Widget _buildChild(context) {
    final schoolContract = Provider.of<SchoolContract>(context);
    final userProvider = Provider.of<User>(context, listen: false);
    User user = userProvider;

    if (user != null) {
      if (user.schools.length != null) {
        if (user.schools.length == 1) {
          final schoolProvider =
              Provider.of<SchoolProvider>(context, listen: false);
          School school = School();
          return FutureBuilder<ApiResponse>(
              future: schoolContract.getByUser(user),
              builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                if (snapshot.hasData) {
                  school = snapshot.data.results[0];
                  schoolProvider.setCurrentlySelectedSchool(school);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              });
        } else {
          return FutureBuilder<ApiResponse>(
              key: Key('schoolList'),
              future: schoolContract.getByUser(user),
              builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                if (snapshot.hasData && snapshot.data.results != null) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        final School school = snapshot.data.results[index];
                        return InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue[50],
                              ),
                              Text(school.name),
                            ],
                          ),
                          onTap: () {
                            final schoolProvider = Provider.of<SchoolProvider>(
                                context,
                                listen: false);
                            schoolProvider.setCurrentlySelectedSchool(school);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        );
                      });
                } else {
                  return Center(
                      child: Text(
                    'Conecting.....',
                    key: Key('text'),
                  ));
                }
              });
        }
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your School'),
        key: Key('appBar'),
      ),
      body: _buildChild(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AddSchool(
              );
            },
          );
        },
      ),
    );
  }
}
