import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/school.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/pages/home_page.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:malta/widgets/school/add_school.dart';
import 'package:provider/provider.dart';

class DisplaySchool extends StatelessWidget {
  Widget _buildChild(context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    User user = userProvider.getCurrentUser;
    final connectionContract = Provider.of<ConnectionContract>(context);

    if (user != null) {
      return FutureBuilder<ApiResponse>(
        future: connectionContract.getAllSchools(user),
        builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.results != null &&
                snapshot.data.results.length != null) {
                  if(snapshot.data.results.length == 1){
                    snapshot.data.results.map((e) {
                      School school = e.school;
                      final schoolProvider = Provider.of<SchoolProvider>(
                            context,
                            listen: false);
                        schoolProvider.setCurrentlySelectedSchool(school);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                    });   
                  }
                  else{
              return GridView.builder(
                  itemCount: snapshot.data.results.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, int index) {
                    return SingleChildScrollView(
                      child: Wrap(children: snapshot.data.results.map((e) {
                            School school = e.school;
                            return InkWell(
                              child: Column(children: [
                                CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.blue[50],
                                  ),
                                Text(school.name)]),
                              onTap: (){
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
                        }).toList(),),
                    );
                   
                  });
                  }
            }
          }
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text('Loading......'),
            ),
          );
        },
      );

    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child:FloatingActionButton(child: Icon(Icons.add),
      onPressed: (){},)),
    );
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
