import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/models/Session.dart';

class ClassTab extends StatelessWidget {
  final List<Session> session;

  const ClassTab({
    Key key,
    this.session,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("Ongoing"),
        ),
        Wrap(
          children: session.map((e) {
            return period(e);
          }).toList(),
        )
      ],
    );
  }

  Widget period(Session subject) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(subject.name),
          SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Image.network(
              subject.image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
