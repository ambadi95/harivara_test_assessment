import 'package:flutter/material.dart';
import 'package:widget_library/utils/icon_utils.dart';

class CardLogo extends StatelessWidget {
  final List<String> images;

  const CardLogo(this.images, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = 20;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: images
              .map(
                (e) => Container(
                  key: Key(_getKey(e)),
                  child: getSvg(
                    e,
                    height: height,
                    width: width,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  String _getKey(String path) {
    return path.split('/').last;
  }
}
