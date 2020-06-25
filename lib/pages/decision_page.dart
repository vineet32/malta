import 'package:flutter/material.dart';
import 'package:malta/domain/constants/application_constants.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:malta/pages/display_school.dart';

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
              _showLogo(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(_parseServerState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  Future<void> _initParse() async {
    try {
      await Parse().initialize(
        keyParseApplicationId,keyParseServerUrl,
      debug: true,appName: keyApplicationName,clientKey: clientId, 
        );
      var response = await Parse().healthCheck();
      if (response.success) {
        //final ParseUser user = await ParseUser.currentUser();
        //if (user != null) {
          _redirectToPage(context, DisplaySchool());
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