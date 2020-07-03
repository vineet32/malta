import 'package:flutter/material.dart';
import 'package:malta/data/models/user.dart';

class ShowUserWidget extends StatelessWidget {
  final User user;

  const ShowUserWidget({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipOval(
            child: user.image == null
                ? Icon(
                    Icons.person,
                    size: 100,
                  )
                : Image.network(
                    user.image.url,
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
          Text(user.name),
        ],
      ),
    );
  }
}
