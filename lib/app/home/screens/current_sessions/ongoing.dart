import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/models/session.dart';
import 'package:random_color/random_color.dart';

class Ongoing extends StatelessWidget {
  final Session session;
  final double width;

  const Ongoing({Key key, @required this.session, this.width: 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return FlatButton(
      onPressed: () {
        print("pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              session.image,
              width: width,
              height: width,
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
            Text(
              session.subject.name,
            ),
          ],
        ),
      ),
    );
  }
}
