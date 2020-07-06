import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/data/models/user.dart';
import 'package:malta/pages/students_in_class.dart';
import 'package:random_color/random_color.dart';

class OngoingWidget extends StatelessWidget {
  final Subject subject;
  final User user;
  final List sections;

  const OngoingWidget({
    Key key,
    this.subject,
    this.user,
    this.sections
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color =
        _randomColor.randomColor(colorBrightness: ColorBrightness.light);
    return FlatButton(
      onPressed: () {
        String selectedSubject=subject['name'];
        List sectionsName=[];
        print('------------------------------------------->');
        for(var section in sections){
          sectionsName.add(section['name']);
        }
        print('------------------------------------------->');
       Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentsInClass(subject: selectedSubject,sections: sectionsName,)));
        print('ongoing..................');
      },
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image.network(
                user.image == null
                    ? "https://i.pinimg.com/736x/4f/ae/53/4fae535ca7e76a966f7b432717cff19c.jpg"
                    : user.image.url,
                width: 140,
                height: 140,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: Container(
                      width: 140,
                      height: 140,
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
