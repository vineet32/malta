import 'package:flutter/material.dart';
import 'package:malta/pages/admin_tabs.dart';
import 'package:malta/pages/current_class.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:provider/provider.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final schoolProvider = Provider.of<SchoolProvider>(context);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              tabIcon(Icons.subtitles, "ClassRoom"),
              tabIcon(Icons.person, "Admin"),
              tabIcon(Icons.playlist_add_check, "Activity"),
            ],
            indicatorWeight: 5,
            labelColor: Colors.red,
            labelPadding: EdgeInsets.all(5),
            unselectedLabelColor: Colors.black,
          ),
          appBar: AppBar(
            title: Text(schoolProvider.school.name),
          ),
          body: TabBarView(
            children: [
              CurrentClass(),
              // Administer(),
              AdminTabs(),
              Icon(Icons.playlist_add_check),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabIcon(IconData icon, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          // color: Colors.black,
        ),
        Text(
          name,
          style: TextStyle(),
        )
      ],
    );
  }
}
