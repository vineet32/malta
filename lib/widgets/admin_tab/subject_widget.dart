import 'package:flutter/material.dart';
import 'package:malta/data/models/subject.dart';
import 'package:malta/widgets/admin_tab/edit_subject.dart';

class SubjectWidget extends StatelessWidget {
  final Subject subject;

  const SubjectWidget({
    Key key,
    this.subject,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EditSubject(
              subject: subject,
            ),
          ),
        ),
        child: Column(
          children: [
            ClipOval(
              child: subject.image == null
                  ? Icon(
                      Icons.person,
                      size: 100,
                    )
                  : Image.network(
                      subject.image.url,
                      width: 100,
                      height: 100,
                      colorBlendMode: BlendMode.colorBurn,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(5),
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
            Text(subject.name),
          ],
        ),
      ),
    );
  }
}
