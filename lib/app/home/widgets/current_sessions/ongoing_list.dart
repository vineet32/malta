import 'package:flutter/cupertino.dart';
import 'package:malta/app/home/models/session.dart';
import 'package:malta/app/home/widgets/current_sessions/ongoing.dart';

class OngoingList extends StatelessWidget {
  final List<Session> session;
  final double width;
  final double height;

  const OngoingList(
      {Key key, @required this.session, this.width: 80, this.height: 100})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: PageStorageKey<String>(session.toString()),
      height: height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: session.map((session) {
            return Ongoing(
              image: session.image,
              name: session.subject.name,
              width: width,
            );
          }).toList(),
        ),
      ),
    );
  }
}
