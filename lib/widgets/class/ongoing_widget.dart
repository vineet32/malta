import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';
import 'package:random_color/random_color.dart';

class OngoingWidget extends StatelessWidget {
  final Subject subject;

  const OngoingWidget({
    Key key,
    this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return FlatButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              subject.image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                subject.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
