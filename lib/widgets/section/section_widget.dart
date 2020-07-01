import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malta/data/models/section.dart';
import 'package:malta/widgets/select_animation.dart';

class SectionWidget extends StatelessWidget {
  final Section section;
  final bool isSelected;

  const SectionWidget({
    Key key,
    this.section,
    this.isSelected: false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SelectAnimation(
        width: 100,
        bottomDescription: Text(section.name),
        selectMode: SelectMode.check,
        isSelected: isSelected,
        child: ClipOval(
          child: Image.network(
            section.image,
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
      ),
    );
  }
}
