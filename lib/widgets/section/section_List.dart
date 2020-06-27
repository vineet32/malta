import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/widgets/section/section_widget.dart';

class SectionList extends StatelessWidget {
  final List sections;
  final Function(List) onSelect;
  final bool isStartClass;
  SectionList({
    Key key,
    this.sections,
    this.onSelect,
    this.isStartClass: true,
  }) : super(key: key);
  final List _selectedSections = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        children: sections
            .map<Widget>((section) => GestureDetector(
                  child: SectionWidget(
                    section: section,
                  ),
                  onTap: () {
                    if (isStartClass) {
                      _selectedSections.add(section);
                      onSelect(_selectedSections);
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
