import 'package:flutter/material.dart';
import 'package:malta/pages/current_class.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              CurrentClass(),
              Icon(Icons.person),
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
