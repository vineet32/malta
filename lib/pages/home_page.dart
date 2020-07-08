import 'package:flutter/material.dart';
import 'package:malta/pages/admin_tabs.dart';
import 'package:malta/pages/current_class.dart';
import 'package:malta/providers/school_provider.dart';
import 'package:malta/widgets/user_profile_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
          drawer: UserProfileDrawer(),
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
