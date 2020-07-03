import 'package:flutter/material.dart';
import 'package:malta/domain/constants/role_constants.dart';
import 'package:malta/pages/display_subjects.dart';
import 'package:malta/pages/edit_school.dart';
import 'package:malta/pages/section_list.dart';
import 'package:malta/widgets/admin_tab/show_user_list.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class AdminTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.w700),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Color(0xff1967d2),
            unselectedLabelColor: Color(0xff5f6368),
            isScrollable: true,
            indicator: MD2Indicator(
              indicatorHeight: 3,
              indicatorColor: Color(0xff1967d2),
              indicatorSize: MD2IndicatorSize.normal,
            ),
            tabs: <Widget>[
              Tab(
                text: "School",
              ),
              Tab(
                text: "Sections",
              ),
              Tab(
                text: "Subjects",
              ),
              Tab(
                text: "Principals",
              ),
              Tab(
                text: "Teachers",
              ),
              Tab(
                text: "Coordinators",
              ),
              Tab(
                text: "Sponsors",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EditSchool(),
            SectionList(),
            DisplaySubjects(),
            ShowUserList(keyPrincipal),
            ShowUserList(keyTeacher),
            ShowUserList(keyCoordinator),
            ShowUserList(keySponsor),
          ],
        ),
      ),
    );
  }
}
