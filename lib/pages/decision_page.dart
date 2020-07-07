import 'package:flutter/material.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/domain/constants/application_constants.dart';
import 'package:malta/pages/login.dart';
import 'package:malta/providers/user_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:malta/pages/display_school.dart';
import 'package:provider/provider.dart';

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
                child: Text(
                  _parseServerState,
                  key: Key('serverStateText'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initParse() async {
    try {
      await Parse().initialize(
        keyParseApplicationId,
        keyParseServerUrl,
        debug: true,
        appName: keyApplicationName,
        clientKey: clientId,
      );
      var response = await Parse().healthCheck();
      if (response.success) {
        final User user =
            await ParseUser.currentUser(customUserObject: User.clone());
        UserProvider provider =
            Provider.of<UserProvider>(context, listen: false);
        provider.setCurrentUser(user);
        if (user != null) {
          // _redirectToPage(context, DisplaySchool());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DisplaySchool()),
          );
        } else {
          // _redirectToPage(context, Login());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
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
}
