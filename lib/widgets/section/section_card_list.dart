import 'package:flutter/material.dart';
import 'package:malta/widgets/section/section_list_item.dart';

class SectionCardList extends StatelessWidget {
  final List sections;

  SectionCardList({@required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: listSections(),
    );
  }

  List<Widget> listSections() {
    return sections.map((section) => SectionListItem(section: section)).toList();
  }
}