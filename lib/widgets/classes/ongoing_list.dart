import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/widgets/classes/ongoing.dart';

class OngoingList extends StatelessWidget {
  final List ongoingList;
  const OngoingList({
    Key key,
    @required this.ongoingList,
  })  : assert(ongoingList != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ongoingList.map<Widget>((element) {
          return Ongoing(
            image: element.subject.image,
            name: element.subject.name,
          );
        }).toList(),
      ),
    );
  }
}
