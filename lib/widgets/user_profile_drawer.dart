import 'package:flutter/material.dart';
import 'package:malta/data/base/api_response.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/data/repositories/connection/connection_contract.dart';
import 'package:malta/data/repositories/user/user_contract.dart';
import 'package:malta/pages/login.dart';
import 'package:malta/pages/edit_user_profile.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:malta/widgets/school/switch_school_widget.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

class UserProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.getCurrentUser;
    final connectionContract = Provider.of<ConnectionContract>(context);
    final userContract = Provider.of<UserContract>(context);

    return Drawer(
      child: ListView(
        children: [
          InkWell(
            child: Container(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue[50],
                          backgroundImage: NetworkImage(user.image != null
                              ? user.image.url
                              : 'https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png'),
                        ),
                      Padding(padding: EdgeInsets.only(bottom: 3.0)),
                      Text(
                          user.username,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                      Padding(padding: EdgeInsets.only(bottom: 3.0)),
                      Text(
                          user.emailAddress,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                    ],
                  ),
                )),
                onTap: ()  {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),
                      fullscreenDialog: true));          
                  },
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Switch School',style: TextStyle(
                  fontSize:18
                ),),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                FutureBuilder<ApiResponse>(
                  future: connectionContract.getAllSchools(user),
                  builder: (context, AsyncSnapshot<ApiResponse> snapshot) {
                    if(snapshot.hasData){
                    return SingleChildScrollView(
                      child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: snapshot.data.results.map((e) {
                      return SwitchSchoolWidget(
                        school: e.school,
                      );
                    }).toList(),
                  ),
                    );}
                    return LinearProgressIndicator();
                  })
              ],
            )),
            Divider(thickness: 0.5,),
          ListTile(title: Text('Logout',style: TextStyle(
                  fontSize:18
                ),),
                onTap: () async {                 
                  var response = await user.logout(deleteLocalUserData: true);
                  if(response.success){
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        Login()), (Route<dynamic> route) => false);
                    print('logout');
                  }
                  else{
                    print(response.error.toString());
                  }
                },)
        ],
      ),
    );
  }
}
