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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text("Ongoing: "),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 10,
            children: session.map((e) {
              return period(e);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget period(Session subject) {
    return Container(
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
