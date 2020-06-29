import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/widgets/section/section_widget.dart';
import 'package:malta/widgets/section/start_class_button.dart';

class SectionList extends StatefulWidget {
  final List sections;
  final Subject subject;
  SectionList({
    Key key,
    this.sections,
    this.subject,
  }) : super(key: key);

  @override
  _SectionListState createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  final List _selectedSections = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.topCenter,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: widget.sections.map<Widget>((section) {
                  bool _isSelected = _selectedSections.contains(section);
                  return FlatButton(
                    child: SectionWidget(
                      section: section,
                      isSelected: _isSelected,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isSelected) {
                          _selectedSections
                              .removeAt(_selectedSections.indexOf(section));
                        } else {
                          _selectedSections.add(section);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        StartClassButton(
          selectedSections: _selectedSections,
          subject: widget.subject,
        )
      ],
    );
  }
}
