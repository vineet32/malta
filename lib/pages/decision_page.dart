import 'package:flutter/material.dart';
//import 'package:malta/data/base/api_response.dart';
//import 'package:malta/data/repositories/school/school_contract.dart';
import 'package:malta/domain/constants/application_constants.dart';
import 'package:malta/pages/login.dart';
//import 'package:malta/pages/current_class.dart';
//import 'package:malta/providers/school_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:malta/pages/display_school.dart';
//import 'package:provider/provider.dart';
//import 'package:malta/providers/user_provider.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  String _parseServerState = 'Checking Parse Server...';
  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initParse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: CircleAvatar(
                    key: Key('parseCloudIcon'),
                    backgroundColor: Colors.transparent,
                    radius: 48.0,
                    child: Icon(Icons.cloud_download),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(_parseServerState,key: Key('serverStateText'),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initParse() async {

    // final currentUserProvider = Provider.of<UserProvider>(context, listen: false);
    // final currentUser = currentUserProvider.getUser;
    // final schoolDataProvider = Provider.of<SchoolContract>(context, listen: false);
    // final schoolProvider = Provider.of<SchoolProvider>(context, listen: false);

    try {
      await Parse().initialize(
        keyParseApplicationId,keyParseServerUrl,
      debug: true,appName: keyApplicationName,clientKey: clientId, 
        );
      var response = await Parse().healthCheck();
      if (response.success) {
        //final ParseUser user = await ParseUser.currentUser();
        //if (user != null) {


          // if(currentUser != null){
          //   return Builder(
          //     builder: (context){
          //        if(currentUser.schools.length > 1){
          //          _redirectToPage(context, DisplaySchool(schools: currentUser.schools));
          //        }
          //        else {
          //          return FutureBuilder<ApiResponse>(
          //            future: schoolDataProvider.getById(currentUser.schools[0]),
          //            builder: (context, AsyncSnapshot<ApiResponse> snapshot){
          //             if(snapshot.hasData){
          //               schoolProvider.setCurrentlySelectedSchool(snapshot.data.results[0]);
          //               _redirectToPage(context, CurrentClass());
          //             }
          //            },
          //            );
          //        }
          //     }
          //   );

          
        //  _redirectToPage(context, DisplaySchool());
        _redirectToPage(context, LogIn());
      
        // } else {
        //   _redirectToPage(context, LoginPage());
        // }
      } else {
        setState(() {
          _parseServerState =
              'Parse Server Not avaiable\n due to ${response.error.toString()}';
        });
      }
    } catch (e) {
      setState(() {
        _parseServerState = e.toString();
      });
    }
  }

  Future<void> _redirectToPage(BuildContext context, Widget page) async {
    final MaterialPageRoute<bool> newRoute =
        MaterialPageRoute<bool>(builder: (BuildContext context) => page,fullscreenDialog: true);

    final bool nav = await Navigator.of(context)
        .pushAndRemoveUntil<bool>(newRoute, ModalRoute.withName('/'));
    if (nav == true) {
      _initParse();
    }
  }
}